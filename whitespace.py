def extract_bits(filename):
    bits = ""
    
    with open(filename, "r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            stripped = line.rstrip("\n")
            trailing = stripped[len(stripped.rstrip()):]
            
            for c in trailing:
                if c == " ":
                    bits += "0"
                elif c == "\t":
                    bits += "1"

    print("The bits: " + bits);
    return bits


def decode_bits(bits, chunk_size):
    chars = []
    
    for i in range(0, len(bits), chunk_size):
        chunk = bits[i:i+chunk_size]
        
        if len(chunk) < chunk_size:
            continue  # skip incomplete chunk
        
        try:
            chars.append(chr(int(chunk, 2)))
        except:
            pass
    
    return "".join(chars)


bits = extract_bits("message.txt")

# Try multiple encodings
for size in [2, 3, 4, 5, 6, 7, 8, 9]:
    print(f"\nTrying {size}-bit chunks:")
    print(decode_bits(bits, size))
