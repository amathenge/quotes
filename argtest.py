import argparse

parser = argparse.ArgumentParser()
group = parser.add_mutually_exclusive_group()
group.add_argument("-q", "--quote", help="ID of the Quote you want to see", type=int)
group.add_argument("-r", "--random", help="Show Random Quote", action="store_true")
args = parser.parse_args()

print(args.quote)
print(args.random)
