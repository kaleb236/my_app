from importlib.resources import files
import json

from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal, pyqtProperty

LESSONS_PATH = files("my_app").joinpath("data/lessons.json")

class AppControl(QObject):
    lesson_changed = pyqtSignal()
    def __init__(self):
        super().__init__()
        self._data = {}
        self.load_lessons()


    def load_lessons(self):
        with open(LESSONS_PATH, "r") as f:
            self._data = json.load(f)
        self.lesson_changed.emit()
    
    @pyqtProperty("QVariantMap", notify=lesson_changed)
    def lessons(self):
        return self._data