
// The `balance` record datatype.
record Balance {
    // The balance owner.
    owner: address,
	gates: u64,
    // The Aleo balance.
    amount: u64,
}

@program
function total_supply(supplies:u64) -> u64 {
	let supplies2: u64 = supplies+supplies;
	return supplies2;
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



@program
function transferfrom(balance: Balance, from:address, to: address, amount: u64) -> (Balance, Balance) {

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
function transfer(balance: Balance, to: address, amount: u64) -> Balance {

    // Checks the given token record has sufficient balance.
    // This `sub` operation is safe, and the proof will fail
    // if an overflow occurs.
    // `difference` holds the change amount to be returned to sender.
    //let difference: u64 = balance.amount - amount;

    // Produce a token record with the change amount for the sender.
    //let remaining: Balance = Balance {
    //    owner: balance.owner,
    //    gates: balance.gates,
    //    amount: difference,
    //};

    // Produce a token record for the specified receiver.
    let transferred: Balance = Balance {
        owner: to,
        gates: 0u64,
        amount: amount,
		// How can I increase the amount ???
    };

    // Output the sender's change record and the receiver's record.
    return  transferred;
}


//  Approve
//  Allowance

// Name      Returns the name of the token.
// Symbol    Returns the symbol of the token, usually a shorter version of the name.
// Decimals  Returns the number of decimals used to get its user representation. For example, if decimals equals 2, a balance of 505 tokens should be displayed //           to a user as 5.05 (505 / 10 ** 2). Tokens usually opt for a value of 18,


@program
function balanceof(owner: address, amountbalance:u64) -> u64 {
	let newBalance: Balance = Balance {
        owner: owner,
		gates: 20u64,
        amount: 40u64,
    };
    return amountbalance;
}


