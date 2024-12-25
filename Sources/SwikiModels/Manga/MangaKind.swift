import Foundation

public enum SwikiMangaKind: String, Decodable, Sendable {
    case manga
    case manhwa
    case manhua
    case lightNovel = "light_novel"
    case novel
    case oneShot = "one_shot"
    case doujin
}
