import random
import string


def random_str(n):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=n))
