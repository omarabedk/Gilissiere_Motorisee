from PySide6.QtCore import QObject, Slot, QTimer
import csv
import random
import os
from datetime import datetime

class SaveCSV(QObject):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.path = ""
        self.paused = True

        # Initialize parameters and their modification times
        self.T1 = 0
        self.T2 = 0
        self.p = 0
        self.Cmax = 0
        self.Xmax = 0

        now_str = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        self.param_mod_times = {
            "T1": now_str,
            "T2": now_str,
            "p": now_str,
            "Cmax": now_str,
            "Xmax": now_str
        }

        self.generate_random_values()

        # Set up a timer for periodic CSV updates
        self.timer = QTimer(self)
        self.timer.timeout.connect(self.update_csv_realtime)
        self.timer.setInterval(1000)  # 1 second


    def generate_random_values(self):
        """Generate dynamic values and update modification times where appropriate."""
        self.vitesse = random.randint(70, 100)
        self.courant = random.randint(50, 80)
        self.Cp = random.randint(20, 30)

        self.update_parameter("T1", random.randint(50, 70))
        self.update_parameter("T2", random.randint(500, 600))
        self.update_parameter("p", random.randint(40, 60))
        self.update_parameter("Cmax", random.randint(40, 60))
        self.update_parameter("Xmax", random.randint(70, 90))

    @Slot(str)
    def apply_button_clicked(self, path):
        self.path = os.path.normpath(path.lstrip('/'))
        print("Apply button clicked! Normalized path:", self.path)
        if self.path:
            self.timer.start()
            print("Timer started, interval:", self.timer.interval())

    @Slot(str, int)
    def update_parameter(self, name, value):
        if hasattr(self, name) and name in self.param_mod_times:
            setattr(self, name, value)
            self.param_mod_times[name] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            print(f"Updated {name} = {value}, time: {self.param_mod_times[name]}")
        else:
            print(f"Unknown parameter: {name}")

    @Slot()
    def toggle_pause(self):
        self.paused = not self.paused
        state = "paused" if self.paused else "resumed"
        print(f"CSV updating has been {state}.")

    @Slot(str, result=str)
    def read_file(self, file_path):
        """Read the contents of a file and return as a string. Create path.txt with Book.csv path if it doesn't exist."""
        try:
            # Check if the file exists
            if not os.path.exists(file_path):
                print(f"File {file_path} does not exist, creating it with path to Book.csv")
                # Get the directory of file_path (path.txt)
                directory = os.path.dirname(file_path) or '.'  # Use current dir if no dirname
                # Construct the path to Book.csv in the same directory
                book_csv_path = os.path.normpath(os.path.join(directory, "C:\Book.csv"))
                # Create the directory if it doesn't exist
                os.makedirs(directory, exist_ok=True)
                # Create path.txt and write the Book.csv path
                with open(file_path, 'w', encoding='utf-8') as file:
                    file.write(book_csv_path)
                    print(f"Created {file_path} with content: {book_csv_path}")

            # Read the contents of path.txt
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read().strip()
                print(f"Read file {file_path}: {content}")
                return content

        except Exception as e:
            print(f"Error processing file {file_path}: {type(e).__name__} {e}")
            return ""
        

    @Slot(str, str, result=bool)
    def write_path_file(self, file_path, content):
        """Write the given content to the specified file and return success status."""
        try:
            # Get the directory of file_path
            directory = os.path.dirname(file_path) or '.'  # Use current dir if no dirname
            # Create the directory if it doesn't exist
            os.makedirs(directory, exist_ok=True)
            # Write content to file
            with open(file_path, 'w', encoding='utf-8') as file:
                file.write(content.strip())
                print(f"Wrote to {file_path}: {content}")
                return True
        except Exception as e:
            print(f"Error writing to file {file_path}: {type(e).__name__} {e}")
            return False


    def update_csv_realtime(self):
        if not self.path:
            print("No path set, skipping update_csv_realtime")
            return
        
        if self.paused:
            print("CSV update is paused.")
            return

        self.generate_random_values()
        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        directory = os.path.dirname(self.path)
        file_exists = os.path.exists(self.path)

        header = ["", "", "", "", "", "Param", "Value", "Temps du dernier modification"]
        param_rows = [
            ["", "", "", "", "", param, getattr(self, param), self.param_mod_times[param]]
            for param in ["T1", "T2", "p", "Cmax", "Xmax"]
        ]
        data_header = ["Temps", "Vitesse du moteur", "Courant du moteur", "Cp"]
        new_data_row = [current_time, self.vitesse, self.courant, self.Cp]

        try:
            os.makedirs(directory, exist_ok=True)

            existing_data = []
            if file_exists:
                try_encodings = ['utf-8', 'cp1252', 'latin1']
                for encoding in try_encodings:
                    try:
                        with open(self.path, 'r', newline='', encoding=encoding) as csvfile:
                            reader = csv.reader(csvfile)
                            existing_data = list(reader)
                        break
                    except Exception as e:
                        print(f"Failed reading CSV with encoding {encoding}: {e}")
                else:
                    with open(self.path, 'r', newline='', encoding='utf-8', errors='replace') as csvfile:
                        reader = csv.reader(csvfile)
                        existing_data = list(reader)

            output_rows = []
            output_rows.append(header)
            output_rows.extend(param_rows)
            output_rows.append([""] * 8)  # spacer row
            output_rows.append(data_header + [""] * 4)  # pad to 8 columns
            output_rows.append(new_data_row + [""] * 4)

            # Append old data rows (excluding the duplicated header)
            for row in existing_data:
                if len(row) >= 4 and row[0] != "Temps" and row[0]:
                    output_rows.append(row[:4] + [""] * 4)

            # Write final result
            with open(self.path, 'w', newline='', encoding='utf-8') as csvfile:
                writer = csv.writer(csvfile)
                writer.writerows(output_rows)

        except Exception as e:
            print("Error writing to CSV:", type(e).__name__, e)
