with open("./logo.txt", "+r") as f:
    lines = []
    for line in f.readlines():
        lines.append(f"[[{line.split('\n')[0]}]],")
    f.seek(0)
    f.write('\n'.join(lines))
