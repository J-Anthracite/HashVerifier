# Welcome to Hash Verifier!
Hash verifier is a simple Batch script for Windows that uses the built in **certUtil** command in windows.

The purpose of Hash Verifier is to make it easier to quickly verify the Hash of a downloaded file. Hash Verifier is a batch script designed to be added to the right click context menu so you can right click on any file and it will get the Hash with the specified algorithm.

I created this because I never remember the exact command and wanted to be able to get the Hash of a file easier. It's pretty basic but from my testing does the job well.

### Hash Verifier supports the following algorithims:
- MD2
- MD4
- MD5
- SHA1
- SHA256
- SHA384
- SHA512

## How To Setup

1. Download the **HashVerifier.bat** from the repository and place somewhere on your pc, ie put it in documents.
2. Open the windows Registry Editor and navigate to `Computer\HKEY_CLASSES_ROOT\*\shell`
3. Right click on `shell` and do **New -> Key** and name it "`Verify Hash`" or whatever you want to appear in the right click context menu.
4. Right click on the new key you just created and do **New -> Key** with the exact name "`Command`"
5. Edit the `(Default)` value inside the Command key to be `"C:\Path\To\HashVerifier.bat" %1` with the path in double quotes using backslashes, Followed by a %1 which passes the file as the first parameter.

**Disclaimer!** While if you follow the instructions there shouldn't be any danger I do not take responsibility if you mess up your windows registry!


## How To Use
Once you have finished setup you should be able to right click on any file and see **Verify Hash** or whatever you named it. When you click that it will open up a command prompt asking for the hash algorithm you want to use. It will then call to certUtil and get the Hash for the file. Optionally after it finishes hashing the file you can then paste a known good Hash and it will compare to see if they match.


## License & Terms
Feel free to use however, but don't redistribute. This comes without warranty and I do not take responsibility if you mess something up or it has any bugs. It is only for quick reference and shouldn't be treated as impervious or used in security critical applications.