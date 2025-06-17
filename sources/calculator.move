module 0x0::calculator_base {
    use sui::tx_context::{Self, TxContext};
    use sui::event::emit; // only emit imported, no `event::emit` call

    #[event]
    public struct ResultEvent has copy, drop, store {
        result: u64,
    }

    public fun add(a: u64, b: u64): u64 {
        a + b
    }

    public fun sub(a: u64, b: u64): u64 {
        a - b
    }

    public fun mul(a: u64, b: u64): u64 {
        a * b
    }

    public fun div(a: u64, b: u64): u64 {
        assert!(b != 0, 0);
        a / b
    }

    public entry fun entry_add(a: u64, b: u64, ctx: &mut TxContext) {
        let result = add(a, b);
        emit<ResultEvent>(ResultEvent { result });
    }

    public entry fun entry_sub(a: u64, b: u64, ctx: &mut TxContext) {
        let result = sub(a, b);
        emit<ResultEvent>(ResultEvent { result });
    }

    public entry fun entry_mul(a: u64, b: u64, ctx: &mut TxContext) {
        let result = mul(a, b);
        emit<ResultEvent>(ResultEvent { result });
    }

    public entry fun entry_div(a: u64, b: u64, ctx: &mut TxContext) {
        let result = div(a, b);
        emit<ResultEvent>(ResultEvent { result });
    }
}
