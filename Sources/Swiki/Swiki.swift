import Foundation
import SwikiModels

/**
 Клиент Shikimori API

 - warning: Добавьте имя приложения Oauth2 в заголовок запросов User-Agent.
 - warning: Не имитируйте браузер.
 - warning: Ваш IP-адрес может быть заблокирован,
 если вы используете API без правильно настроенного заголовка User-Agent.


 # Notes: #
 1. Когда вы запрашиваете N элементов из API с разбивкой на страницы,
 в большинстве случаев вы получите N + 1 результатов, если у API есть следующая страница.

 # Example #
 ```
TODO: - добавить пример
 ```
 */
@SwikiActor
final class Swiki: Sendable {

    func handleMetohd() async throws {
        try await SwikiActor.shared.submit {

        }
    }

}
