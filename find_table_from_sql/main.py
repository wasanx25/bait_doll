#!/usr/bin/env python3
import argparse
import sql_metadata
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='hoge')
    parser.add_argument('filename', type=str)
    args = parser.parse_args()
    with open(args.filename) as f:
        read_data = f.read()
    f.close()
    for name in sql_metadata.get_query_tables(read_data):
        print(name)

