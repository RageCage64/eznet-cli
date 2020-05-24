# eznet-cli: A command line application with netstat shortcuts

Have you ever needed to remember how to check what process is on a port and forgotten how to do it? There are loads of netstat commands that can be tricky to remember. This is a work in progress command line application to give direct shortcuts to those netstat operations.

## Options

### -v, --version
Show application version.

### -h, --help
Show help menu.

### -c PORT, --check-port=PORT
Get the name and process ID of the process running on a given port

### -p PNAME, --find-process=PNAME
Find the port and ID of a process by name (matching by containing text)

### -k PORT, --kill-port=PORT
Check the process running on a given port with the option to kill it if you'd like.

## TODO
- [x] Add the ability to kill process on port
- [x] Add the ability to search for process by name
- [ ] Maybe look into other cli operations? (getting IP?)
- [ ] Come up with other useful stuff
- [ ] Write up contributors guide
- [ ] Decide how to do documentation (probably Github wiki?)
- [ ] Write man page (figure out how to do that lol)
- [ ] Figure out distribution/release
- [x] Set up CI (probably Travis)

## Contributing
I don't know that I'm ready for contributors yet because I don't have a good contributors guide. I do plan to eventually open this up to contributors. If you have any ideas for future operations, please feel free to open an issue, I am happy to discuss ideas!
