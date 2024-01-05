struct ApiResponse<T: Decodable>: Decodable {
    let data: [T]
    let meta: Meta
}

struct Meta: Decodable {
    let pagination: Pagination
}

struct Pagination: Decodable {
    let current: Int
    let first: Int?
    let prev: Int?
    let next: Int?
    let last: Int?
    let records: Int
}
