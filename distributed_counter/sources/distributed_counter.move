/*
/// Module: distributed_counter
module distributed_counter::distributed_counter;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module distributed_counter::distributed_counter {

    // Stores the addr of owner, its current value, own id.
    public struct Counter has key {
        id: UID,
        owner: address,
        value: u64
    }

    // Creates and Share a new Counter object
    public fun create(ctx: &mut TxContext) {
        transfer::share_object(Counter {
            id: object::new(ctx),
            owner: ctx.sender(),
            value: 0
        })
    }

    // Accepts mutable ref to any shared Counter obj & increments its value field
    public fun increment(counter: &mut Counter) {
        counter.value = counter.value + 1;
    }

    /* Accepts a mutable reference to any shared Counter object, the value to set its value field, 
    and the ctx which contains the sender of the transaction. The Counter owner is the only one that can run this function.*/
    public fun set_value(counter: &mut Counter, value: u64, ctx: &TxContext) {
        assert!(counter.owner == ctx.sender(), 0);
        counter.value = value;
    }
}
