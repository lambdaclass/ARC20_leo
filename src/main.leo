// ARC20.

record Totalsupply {
    owner: address,
    gates: u64,
    amount: u64,
}

record Balance {
    // The balance owner.
    owner: address,
	gates: u64,
    // The Aleo balance.
    amount: u64,
}

/*
@program
function total_supply(supply: Totalsupply) -> u64 {
	let zero: u64 = 0u64;
	let return_supply:u64 = supply.amount;    
	return_supply = return_supply + zero;
	return return_supply;
}


@program
function test_total_supply(supply: Totalsupply) -> bool {
    let test_amount_supply:u64 = 100u64;
	let zero: u64 = 0u64;
	let return_supply:u64 = supply.amount;    
	return_supply = return_supply + zero;

    //console.assert(return_supply == test_amount_supply);
    return return_supply == test_amount_supply;
}


*/

@program
function transferfrom(from_balance: Balance, to_balance: Balance, from:address, to: address, amount: u64) -> (Balance, Balance) {
    let difference: u64 = from_balance.amount - amount;
    let remaining: Balance = Balance {
        owner: from,
        gates: from_balance.gates,
        amount: difference,
    };

	let increment: u64 = to_balance.amount + amount;
    let transferred: Balance = Balance {
        owner: to,
        gates: to_balance.gates,
        amount: increment,
    };

    // Output the sender's change record and the receiver's record.
    return (remaining, transferred);
}

@program
function test_transferfrom(from_balance: Balance, to_balance: Balance, from:address, to: address, amount: u64) -> bool {

    let difference: u64 = from_balance.amount - amount;

    let test_remaining: Balance = Balance {
        owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
        gates: 0u64,
        amount: 20u64,
    };
    let test_transferred: Balance = Balance {
        owner: aleo1mgfq6g40l6zkhsm063n3uhr43qk5e0zsua5aszeq5080dsvlcvxsn0rrau,
        gates: 0u64,
        amount: 35u64,
    };

    let remaining: Balance = Balance {
        owner: from,
        gates: from_balance.gates,
        amount: difference,
    };

	let increment: u64 = to_balance.amount + amount;
    let transferred: Balance = Balance {
        owner: to,
        gates: to_balance.gates,
        amount: increment,
    };

	let test_address_from: bool = false;
	let test_gates_from: bool = false;
	let test_amount_from: bool = false;
	
    return remaining == Balance {
        owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
        gates: 0u64,
        amount: 20u64,
    };
	
	
}


/*

@program
function transfer(to_balance: Balance, to: address, amount: u64) -> Balance {
	let increment_amount: u64 = to_balance.amount + amount;
    let transferred: Balance = Balance {
        owner: to,
        gates: to_balance.gates,
        amount: increment_amount,
    };
    return  transferred;
}

@program
//The allowance() function returns the token amount remaining, which the spender is currently allowed to withdraw from the owner's account.
//This function must returns uint256 remaining, but for 'test' the amount is a parameter.
function allowance(owner: address, spender: address, balance_owner: Balance, amount_desired : u64 )-> u64 {
    // return 1 if the amount is valid and 0 otherwise
	let response:u64 = 1u64;	
	//let amount_owner: u64 = balance_owner.amount;
	if balance_owner.amount < amount_desired{
		response = 0u64;
	}
    return response;
}

@program
function approve(spender: address, balance_spender: Balance, amount_desired : u64 )-> u64 {
	let response:u64 = 1u64;
    if response < 1u64 {
	    response = 0u64;}	
    return response;
}

//Let's assume we have user A and user B. A has 1000 tokens and want to give permission to B to spend 100 of them.
//    A will call approve(address(B), 100)
//    B will check how many tokens A gave him permission to use by calling allowance(address(A), address(B))
//    B will send to his account these tokens by calling transferFrom(address(A), address(B), 100)



// Name      Returns the name of the token.
// Symbol    Returns the symbol of the token, usually a shorter version of the name.
// Decimals  Returns the number of decimals used to get its user representation. For example, if decimals equals 2, a balance of 505 tokens should be displayed //           to a user as 5.05 (505 / 10 ** 2). Tokens usually opt for a value of 18,


@program
function balanceof(owner_balance: Balance) -> u64 {
	let amount_balance: u64 = owner_balance.amount;
	let minimun: u64 = 0u64;
	let return_balance:u64 = 0u64;
	if amount_balance >= minimun{
		return_balance = amount_balance;
	}
    return return_balance;
}




@program
function mint(owner: address, amount: u64, totalsupply_amount: u64, gates:u64, balance:Balance) -> (Balance, u64) {
    let newtotalsupply: u64 = (totalsupply_amount + amount );
	let increment: u64 = balance.amount + amount;
	let newBalance: Balance = Balance {
        owner: owner,
		gates: gates,
        amount: increment,
    };
    return (newBalance, newtotalsupply);
}




*/
