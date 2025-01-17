# data_structures_demo.py

def demo_data_structures():
    my_list = [1, 2, 3, 2, 1]
    my_set = {1, 2, 3, 2, 1}  # redundante Elemente fallen weg
    my_tuple = (10, 20, 30)
    my_dict = {"alice": 25, "bob": 30}

    print("List:", my_list)    # [1, 2, 3, 2, 1]
    print("Set:", my_set)      # {1, 2, 3}
    print("Tuple:", my_tuple)  # (10, 20, 30)
    print("Dict:", my_dict)    # {'alice': 25, 'bob': 30}

    # Hinzufügen in dict:
    my_dict["charlie"] = 40
    # my_tuple[0] = 99  # Fehler, tuples sind unveränderlich.

if __name__ == "__main__":
    demo_data_structures()
