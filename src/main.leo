
// The `balance` record datatype.
record Balance {
    // The balance owner.
    owner: address,
	gates: u64,
    // The Aleo balance.
    amount: u64,
}

@program
function to2(suppliess:u64) -> u64 {
	let suppliess2: u64 = suppliess;
	return suppliess;
}

@program
function mint(owner: address, amount: u64, totalsupply: u64, gates:u64, balance:Balance) -> (Balance, u64) {
    let newtotalsupply: u64 = (totalsupply + amount );
	let increment: u64 = balance.amount + amount;
	let newBalance: Balance = Balance {
        owner: owner,
		gates: gates,
        amount: increment,
    };
    return (newBalance, newtotalsupply);
}


// The `transfer` function sends the specified number of tokens
// to the receiver from the provided token record.
@program
function transfer(balance: Balance, to: address, amount: u64) -> (Balance, Balance) {

    // Checks the given token record has sufficient balance.
    // This `sub` operation is safe, and the proof will fail
    // if an overflow occurs.
    // `difference` holds the change amount to be returned to sender.
    let difference: u64 = balance.amount - amount;

    // Produce a token record with the change amount for the sender.
    let remaining: Balance = Balance {
        owner: balance.owner,
        gates: balance.gates,
        amount: difference,
    };

    // Produce a token record for the specified receiver.
    let transferred: Balance = Balance {
        owner: to,
        gates: 0u64,
        amount: amount,
    };

    // Output the sender's change record and the receiver's record.
    return (remaining, transferred);
}


@program
function balanceof(owner: address, amountbalance:u64) -> u64 {
	let newBalance: Balance = Balance {
        owner: owner,
		gates: 20u64,
        amount: 40u64,
    };
    return amountbalance;
}


