import Foundation

public struct SwikiSeason: Encodable, Sendable, RawRepresentable {

    public let rawValue: String

    /// Аниме древности
    public let ancient: Bool
    /// Конкретный год
    public let year: SwikiSeason.Year?
    /// Вермя года
    public let ofYear: SwikiSeason.OfYear?
    /// Десятилетие
    public let yearX: SwikiSeason.YearX?

    init(
        ofYear: SwikiSeason.OfYear? = nil,
        year: SwikiSeason.Year? = nil,
        yearX: SwikiSeason.YearX? = nil,
        ancient: Bool = false
    ) {
        self.ofYear = ofYear
        self.yearX = yearX
        self.year = year
        self.ancient = ancient
        if ancient {
            rawValue = "ancient"
        } else if let yearX {
            rawValue = "\(String(yearX.year).dropLast() + "X")"
        } else if let year {
            rawValue = "\(year.full)"
        } else if let ofYear {
            rawValue = "\(ofYear.season.rawValue)_\(ofYear.year.full)"
        } else {
            rawValue = "-"
        }
    }
    
    /// Создаёт сезон «Аниме древности»
    public static func ancient() -> Self {
        SwikiSeason(ancient: true)
    }
    
    /**
     Создаёт сезон для определённого года

     # Пример #
     ```swift
     let seasonYear: SwikiSeason.Year = SwikiSeason.Year(century: .c20, decade: .d10, yearOfDecade: .y1)
     print(seasonYear.full) // 2011
     let season: SwikiSeason = .year(seasonYear)
     ```
     */
    public static func year(_ year: SwikiSeason.Year) -> Self {
        return SwikiSeason(year: year)
    }

    /**
     Создаёт сезон для определённого десятилетия

     # Пример #
     ```swift
     let season: SwikiSeason = .decade(.d10, century: .c20) // 2010
     ```
     */
    public static func decade(_ decade: SwikiSeason.Decade, century: SwikiSeason.Century) -> Self {
        return SwikiSeason(yearX: YearX(century: century, decade: decade))
    }

    /**
     Создаёт сезон для определённого года, включая время года

     # Пример #
     ```swift
     let seasonYear: SwikiSeason.Year = SwikiSeason.Year(century: .c20, decade: .d10, yearOfDecade: .y1)
     let seasonOfYear: SwikiSeason.OfYear = SwikiSeason.OfYear(season: .spring, year: seasonYear)
     let season: SwikiSeason = .seasonOfYear(seasonOfYear) // spring_2011
     ```
     */
    public static func seasonOfYear(_ year: SwikiSeason.OfYear) -> Self {
        SwikiSeason(ofYear: year)
    }

}

public extension SwikiSeason {

    init?(rawValue: String) {
        // 1) Если это "ancient"
        if rawValue == "ancient" {
            self.ancient = true
            self.ofYear = nil
            self.year = nil
            self.yearX = nil
            self.rawValue = rawValue
            return
        }

        // 2) Если формат типа "spring_2011" → (Season_Year)
        if rawValue.contains("_") {
            // Разбиваем по символу '_', ожидая ровно 2 части
            let components = rawValue.split(separator: "_", omittingEmptySubsequences: false)
            guard
                components.count == 2,
                let seasonRaw = components.first,
                let yearString = components.last,
                let season = SwikiSeason.OfYear.Season(rawValue: String(seasonRaw)),
                let yearInt = Int(yearString)
            else {
                return nil
            }

            // Пытаемся распарсить yearInt как (century, decade, yearOfDecade)
            guard let (century, decade, yearOfDecade) = Self.parseYearComponents(yearInt)
            else { return nil }

            let year = SwikiSeason.Year(century: century, decade: decade, yearOfDecade: yearOfDecade)

            self.ofYear = SwikiSeason.OfYear(season: season, year: year)
            self.year = nil
            self.yearX = nil
            self.ancient = false
            self.rawValue = rawValue
            return
        }

        // 3) Если это формат вида "201X" → десятилетие (2010)
        if rawValue.hasSuffix("X") {
            let rawValueWithPrefix = rawValue
            // Убираем последний символ 'X'
            let prefix = rawValue.dropLast() // например, "201"
            // Пробуем сконвертировать в Int
            guard let baseInt = Int(prefix) else {
                return nil
            }
            // Прибавляем 0 в конец, получая «целый год» (2010)
            let decadeInt = baseInt * 10

            guard let (century, decade, _) = Self.parseYearComponents(decadeInt) else {
                return nil
            }
            
            // Это именно десятилетие
            self.yearX = SwikiSeason.YearX(century: century, decade: decade)
            self.year = nil
            self.ofYear = nil
            self.ancient = false
            self.rawValue = rawValueWithPrefix
            return
        }

        // 4) Если это просто число (например, "2011") → конкретный год
        if let yearInt = Int(rawValue) {
            guard let (century, decade, yearOfDecade) = Self.parseYearComponents(yearInt) else {
                return nil
            }
            self.year = SwikiSeason.Year(century: century, decade: decade, yearOfDecade: yearOfDecade)
            self.ofYear = nil
            self.yearX = nil
            self.ancient = false
            self.rawValue = rawValue
            return
        }

        // 5) Если ничто из вышеперечисленного не подошло — возвращаем nil
        return nil
    }

}

extension SwikiSeason {

    public enum Century: Int, Encodable, Sendable {
        /// 1900
        case c20 = 1900
        /// 2000
        case c21 = 2000
    }

    public enum Decade: Int, Encodable, Sendable {
        case d00 = 00
        case d10 = 10
        case d20 = 20
        case d30 = 30
        case d40 = 40
        case d50 = 50
        case d60 = 60
        case d70 = 70
        case d80 = 80
        case d90 = 90
    }

    public enum YearDecade: Int, Encodable, Sendable {
        case y0 = 0
        case y1 = 1
        case y2 = 2
        case y3 = 3
        case y4 = 4
        case y5 = 5
        case y6 = 6
        case y7 = 7
        case y8 = 8
        case y9 = 9
    }

    public struct Year: Encodable, Sendable {
        public let century: Century
        public let decade: Decade
        public let yearOfDecade: YearDecade
        public let full: Int

        public init(
            century: Century,
            decade: Decade,
            yearOfDecade: YearDecade
        ) {
            self.century = century
            self.decade = decade
            self.yearOfDecade = yearOfDecade
            self.full = century.rawValue + decade.rawValue + yearOfDecade.rawValue
        }

    }

    public struct OfYear: Encodable, Sendable {

        public enum Season: String, Encodable, Sendable {
            case spring
            case summer
            case fall
            case winter
        }

        public let season: Season
        public let year: Year

        public init(season: Season, year: Year) {
            self.season = season
            self.year = year
        }

    }


    public struct YearX: Encodable, Sendable {
        public let century: Century
        public let decade: Decade
        public let year: Int
        public init(century: Century, decade: Decade) {
            self.century = century
            self.decade = decade
            self.year = century.rawValue + decade.rawValue
        }
    }

    private static func parseYearComponents(_ year: Int) -> (SwikiSeason.Century, SwikiSeason.Decade, SwikiSeason.YearDecade)? {
        // 1. Определяем век
        let century: SwikiSeason.Century
        let base: Int

        if year >= 2000, year < 2100 {
            century = .c21
            base = 2000
        } else if year >= 1900, year < 2000 {
            century = .c20
            base = 1900
        } else {
            // Выходим, если год вне [1900..2099]
            return nil
        }

        // 2. Считаем «сколько» лет от базовой точки.
        // Например, 2011 - 2000 = 11
        let diff = year - base

        // diff = 11 → decade = 1, yearOfDecade = 1
        let dec = diff / 10        // 11/10 = 1
        let y   = diff % 10        // 11 % 10 = 1

        // 3. Пробуем создать `Decade` и `YearDecade`
        guard
            let decade = SwikiSeason.Decade(rawValue: dec * 10),
            let yearDecade = SwikiSeason.YearDecade(rawValue: y)
        else {
            return nil
        }

        return (century, decade, yearDecade)
    }

}
