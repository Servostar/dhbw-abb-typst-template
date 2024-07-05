import yaml
import logging
import sys
import re

global data

def replace_tag(match):
    return data[match.group(1)]

if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')
    logger = logging.getLogger()

    with open(sys.argv[1], 'r') as file:
        data = yaml.safe_load(file)

        content = ""

        with open(sys.argv[2], "r") as file:
            logger.info(f"opened file: {sys.argv[2]}")
            content = file.read()
            logger.info(f"read file: {sys.argv[2]}")
        
            logger.info(f"converting...")
            content = re.sub("\\{\\{([a-z0-9-]+)\\}\\}", replace_tag, content, 0, re.IGNORECASE)

            with open(sys.argv[3], "w") as file:
                logger.info(f"writing changes...")
                file.write(content)