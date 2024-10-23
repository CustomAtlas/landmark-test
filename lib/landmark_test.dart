/// Объект достопримечательность с полями название, часы и важность
class Landmark {
  final String name;
  final double hours;
  final int importance;

  const Landmark({
    required this.name,
    required this.hours,
    required this.importance,
  });
}

/// Функция для сортировки: принимает общее количество часов, часы на сон и список [Landmark]
/// Возвращает оптимальные места для посещения, учитывая время и важность
List<Landmark> sortLandmarks({
  required double totalHours,
  required double sleepHours,
  required List<Landmark> landmarksList,
}) {
  /// Сначала сортируем список по разнице важности и затрачиваемого времени
  /// После сортировки первыми идут объекты с максимальной важностью и минимальным временем
  landmarksList.sort(
    (a, b) => (b.importance - b.hours).compareTo(a.importance - a.hours),
  );

  /// Возвращаемый список, в цикле ниже добавляем туда объекты
  List<Landmark> primeLandmarks = [];

  /// Время, в которое нужно уложиться
  double freeHours = totalHours - sleepHours;

  /// В этом цикле по порядку проверяем достопримечательности, отнимая время из свободного:
  /// добавляем объекты в [primeLandmarks] пока есть свободное время
  /// и время на достопримечательность меньше свободного
  for (Landmark landmark in landmarksList) {
    if (freeHours > 0 && freeHours - landmark.hours > 0) {
      freeHours -= landmark.hours;
      primeLandmarks.add(landmark);
    }
  }
  return primeLandmarks;
}

/// Общее количество часов, часы на сон и достопримечательности взяты из задания
void main() => sortLandmarks(
      totalHours: 48,
      sleepHours: 2 * 8,
      landmarksList: [
        Landmark(
          name: 'Исаакиевский собор',
          hours: 5,
          importance: 10,
        ),
        Landmark(
          name: 'Эрмитаж',
          hours: 8,
          importance: 11,
        ),
        Landmark(
          name: 'Кунсткамера',
          hours: 3.5,
          importance: 4,
        ),
        Landmark(
          name: 'Петропавловская крепость',
          hours: 10,
          importance: 7,
        ),
        Landmark(
          name: 'Ленинградский зоопарк',
          hours: 9,
          importance: 15,
        ),
        Landmark(
          name: 'Медный всадник',
          hours: 1,
          importance: 17,
        ),
        Landmark(
          name: 'Казанский собор',
          hours: 4,
          importance: 3,
        ),
        Landmark(
          name: 'Спас на Крови',
          hours: 2,
          importance: 9,
        ),
        Landmark(
          name: 'Зимний дворец Петра I',
          hours: 7,
          importance: 12,
        ),
        Landmark(
          name: 'Зоологический музей',
          hours: 5.5,
          importance: 6,
        ),
        Landmark(
          name: 'Музей обороны и блокады Ленинграда',
          hours: 2,
          importance: 19,
        ),
        Landmark(
          name: 'Русский музей',
          hours: 5,
          importance: 8,
        ),
        Landmark(
          name: 'Навестить друзей',
          hours: 12,
          importance: 20,
        ),
        Landmark(
          name: 'Музей восковых фигур',
          hours: 2,
          importance: 13,
        ),
        Landmark(
          name: 'Литературно-мемориальный музей Ф.М. Достоевского',
          hours: 4,
          importance: 2,
        ),
        Landmark(
          name: 'Екатерининский дворец',
          hours: 1.5,
          importance: 5,
        ),
        Landmark(
          name: 'Петербургский музей кукол',
          hours: 1,
          importance: 14,
        ),
        Landmark(
          name: 'Музей микроминиатюры «Русский Левша»',
          hours: 3,
          importance: 18,
        ),
        Landmark(
          name: 'Всероссийский музей А.С. Пушкина и филиалы',
          hours: 6,
          importance: 1,
        ),
        Landmark(
          name: 'Музей современного искусства Эрарта',
          hours: 7,
          importance: 16,
        ),
      ],
    );
