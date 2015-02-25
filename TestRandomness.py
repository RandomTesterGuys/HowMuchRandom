#!/usr/bin/python


if __name__ == "__main__":
    with open('./output.txt') as f:
        lines = f.read().splitlines()
    
    print lines
    print "Done!"
