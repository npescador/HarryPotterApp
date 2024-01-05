
protocol NetworkClient {
    func get<T: Decodable>(url: String) async throws -> T
}
