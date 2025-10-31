# 🕵️ Steganography Reference Notes

This repo contains a quick reference guide for common **steganography techniques and tools**.  
Useful for CTFs, forensic investigations, and general security practice.

---

## 🔍 Basic Tools

1. **View image**
   
      eog image.png

3. View text from image

      cat image.png
   
      strings image.png


3. View metadata

      exiftool image.png




🧮 Binary to Text Decoding

Sometimes you get binary strings hidden inside an image.
You can decode them as follows:

Python 2

      python2 -c 'print hex(int("01000101", 2))[2:].decode("hex")'

> [2:] removes the 0x from the hex string.



Python 3

      import binascii
      bin_str = "01000101"
      hex_str = hex(int(bin_str, 2))[2:] # binary → hex
      decoded = binascii.unhexlify(hex_str)
      print(decoded.decode())

One-liner (Python 3)

      import binascii; print(binascii.unhexlify(hex(int("01000101",2))[2:]).decode())


Add few bytes to the begining of a broken image/file :

      printf '\xFF\xD8' | cat - broken.jpg > fixed.jpg



🎨 Image Stego Tools

4. Stegsolve (Java GUI tool)
View image in different color planes.
Unihide redacted/colored text in an image
👉 Useful for LSB and palette-based stego.


6. zsteg
Detect hidden data in PNG and BMP.

      zsteg file.png
      zsteg -a file.png



🌐 Online & CLI Tools

6. Decode text from image online
7. 
      https://stylesuxx.github.io/steganography


8. Steghide
   
      Hide or Unhide hidden data using a password.

      steghide extract -sf stegfile.png

9. Stegseek : Bruteforce steghide password and extract the hidden text

       stegseek steg.jpg

      Output: [i] Found passphrase: "87654321"  [i] Original filename: "ste.txt".  [i] Extracting to "ste.jpg.out".


🛠️ File Analysis

8. binwalk → Analyzes files (firmware, PNG, JPEG, PDF) and detects embedded files, code, or data inside.

      binwalk file.jpg

Example output:

Hey, there’s a ZIP file starting at offset 0x1234

Extract everything automatically:

      binwalk --dd='.*' file.jpg

9. foremost → Extracts all hidden/embedded/deleted files.

      foremost file.jpg

10. Autopsy - advanced disk scanning tool (also scans deleted files) eg .dd, .img, etc. Has advanced feature like keyword search that performs deepscanning.

       sudo autopsy

12. zbarimg _ tool for decoding qrcode

       zbarimg output.png

13. Sonic Visualizer. audio analysis and modulation tool
    
📚 Summary

Use exiftool, strings, and binwalk for quick inspection.

Check for binary → hex → ASCII conversions if binary strings are found.

Try zsteg and stegsolve for PNG/BMP stego.

Use steghide if a password-protected payload is suspected.

Automate extraction with binwalk and foremost.
