import os

def find_md_files(directory):
    # md_files = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".md"):
                print(file)


def main():
    print("Files:")
    find_md_files("../")


if __name__ == "__main__":
    main()

