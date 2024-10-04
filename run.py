import enum


class SYSTEM(enum.Enum):
    FEDORA = enum.auto()
    OTHER = enum.auto()


def get_system() -> SYSTEM:
    return SYSTEM.FEDORA


def build_utils(current_system: SYSTEM) -> list[str]:
    result: list[str] = []
    result.append("bash")
    if current_system == SYSTEM.FEDORA:
        result.append("python3")
    else:
        pass
    return result


def basic_system_stuff(current_system: SYSTEM) -> list[str]:
    result: list[str] = []
    if current_system == SYSTEM.FEDORA:
        result.append("NetworkManager")
    else:
        pass
    return result


def main():
    current_system = get_system()
    to_install: list[str] = []

    to_install.extend(build_utils(current_system))
    to_install.extend(basic_system_stuff(current_system))


if __name__ == "__main__":
    main()
