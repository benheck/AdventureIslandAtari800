import argparse

def convert_line_endings(input_file, output_file, to_atari):
    if to_atari:
        # Convert CR LF to 0x9B
        with open(input_file, 'r', newline='') as f:
            content = f.read()

        content = content.replace('\r\n', chr(0x9B))

        with open(output_file, 'wb') as f:
            f.write(content.encode('latin-1'))

    else:
        # Convert 0x9B to CR LF
        with open(input_file, 'rb') as f:
            content = f.read()

        content = content.replace(b'\x9B', b'\r\n')

        with open(output_file, 'w', newline='') as f:
            f.write(content.decode('latin-1'))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Convert line endings.')
    parser.add_argument('input_file', type=str, help='Input file name')
    parser.add_argument('output_file', type=str, help='Output file name')
    parser.add_argument('--toAtari', action='store_true', help='Convert to Atari format')
    parser.add_argument('--toPC', action='store_true', help='Convert to PC format')
    args = parser.parse_args()

    if args.toAtari and args.toPC:
        print("Please choose only one conversion option.")
    elif not args.toAtari and not args.toPC:
        print("Please specify a conversion option (--toAtari or --toPC).")
    else:
        if args.toAtari:
            convert_line_endings(args.input_file, args.output_file, True)
        elif args.toPC:
            convert_line_endings(args.input_file, args.output_file, False)
        print("Conversion complete.")
