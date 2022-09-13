// ARC20.

record Balance {
	// The Aleo balance.
	owner: address,
	gates: u64,
	amount: u64,
}

@program
function approve(owner: address, amount_owner: u64, spender: address, amount_desired : u64 )-> bool {
	let response_approve:bool = false;
	if amount_owner >= amount_desired {
		response_approve = true;
	}
	return response_approve;
}


@program
function test_approve(owner: address, amount_owner: u64, spender: address, amount_desired : u64 )-> bool {
	let response_approve:bool = false;
	if amount_owner >= amount_desired {
		response_approve = true;
	}
	
	// Test
	let test_bool_approve: bool = false;
	let approve_bool: bool = true;
	if response_approve == approve_bool {
		test_bool_approve = true;
	}
	return test_bool_approve;
}

@program
//The allowance() function returns the token amount remaining, which the spender is currently allowed to withdraw from the owner's account.
//This function must returns uint256 remaining, but for 'test' the amount is a parameter.
function allowance(owner: address, spender: address, balance_owner: Balance, amount_remaining : u64 )-> u64 {
	// return 1 if the amount is valid and 0 otherwise
	let response:u64 = 0u64;	
	//let amount_owner: u64 = balance_owner.amount;
	if amount_remaining < balance_owner.amount {
		response = amount_remaining;
	}
	return response;
}

@program
function test_allowance(owner: address, spender: address, balance_owner: Balance, amount_remaining : u64 )-> bool {
	// return 1 if the amount is valid and 0 otherwise
	let response:u64 = 0u64;	
	if amount_remaining < balance_owner.amount {
		response = amount_remaining;
	}
	
	// Test	
	let test_allowance_bool: bool = false;
	let test_response:u64 = 78u64;
	if test_response == response {
		test_allowance_bool = true;
	}
	return test_allowance_bool;

}

@program
function transferfrom(from_balance: Balance, from:address, to_address: address, to_gates: u64, to_amount: u64,  amount: u64) -> (Balance, address, u64, u64) {
	let difference: u64 = from_balance.amount - amount;
	let remaining: Balance = Balance {
		owner: from,
		gates: from_balance.gates,
		amount: difference,
	};
	let increment: u64 = to_amount + amount;

	// Output the sender's change record and the receiver's record.
	return (remaining, to_address, increment, to_gates );
}

@program
function test_transferfrom(from_balance: Balance, from:address, to_address: address, to_gates: u64, to_amount: u64,  amount: u64) -> bool {
	let difference: u64 = from_balance.amount - amount;
	let remaining: Balance = Balance {
		owner: from,
		gates: from_balance.gates,
		amount: difference,
	};
	let increment: u64 = to_amount + amount;
	
	// Test
	let transferred: Balance = Balance {
		owner: to_address,
		gates: to_gates,
		amount: increment,
	};

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

	//remaining ( from );
	let test_owner_from: bool = false;	
	let test_gates_from: bool = false;
	let test_amount_from: bool = false;

	//transferred ( to );
	let test_owner_to: bool = false;
	let test_gates_to: bool = false;
	let test_amount_to: bool = false;	
	
	//remaining ( from ); 
	if test_remaining.owner == remaining.owner{
			test_owner_from = true;
			}
	if test_remaining.gates == remaining.gates{
			test_gates_from = true;
			}
	if test_remaining.amount == remaining.amount{
			test_amount_from = true;
			}
			
	let test_remaining_final: bool = false;	
	if test_owner_from == true{
		if test_gates_from == true{
			if test_amount_from == true{
				test_remaining_final = true;
			}
		}
	}
			
	//transferred ( to );
	if test_transferred.owner == transferred.owner{
			test_owner_to = true;
			}
	if test_transferred.gates == transferred.gates{
			test_gates_to = true;
			}
	if  test_transferred.amount == transferred.amount{
			test_amount_to = true;
			}
	let test_transferred_final: bool = false;		
	if test_owner_to == true{
		if test_gates_to == true{
			if test_amount_to == true{
				test_transferred_final = true;
			}
		}
	}
	
	let test_final:bool = false;
	if test_transferred_final == true{
		if test_remaining_final == true{
			test_final = true;
		}
	}

	return test_final;
}

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
function test_balanceof(owner_balance: Balance) -> bool {
	let amount_balance: u64 = owner_balance.amount;
	let minimun: u64 = 0u64;
	let return_balance:u64 = 0u64;
	if amount_balance >= minimun{
		return_balance = amount_balance;
	}

	// Test	
	let test_balanceoff_bool: bool = false;
	if return_balance == 269u64{
		test_balanceoff_bool = true;
	}
	
	return test_balanceoff_bool;
}

@program
function total_supply(amount_supply: u64) -> u64 {
	let zero: u64 = 0u64;
	let return_supply:u64 = amount_supply;    
	return_supply = return_supply + zero;
	return return_supply;
}

@program
function test_total_supply(amount_supply: u64) -> bool {
	let zero: u64 = 0u64;
	let return_supply:u64 = amount_supply;    
	return_supply = return_supply + zero;
	
	// Test
	let test_total_supply_bool: bool = false;
	if return_supply == 1729u64{
		test_total_supply_bool = true;
		}
	return test_total_supply_bool;
}

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
function test_transfer(to_balance: Balance, to: address, amount: u64) -> bool {
	let increment_amount: u64 = to_balance.amount + amount;
	let transferred: Balance = Balance {
		owner: to,
		gates: to_balance.gates,
		amount: increment_amount,
	};
	
	// Test
	let test_transferred: Balance = Balance {
	owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
	gates: 0u64,
	amount: 30u64,
    };

	// test_to);
	let test_owner_to: bool = false;
	let test_gates_to: bool = false;
	let test_amount_to: bool = false;	
	
	if test_transferred.owner == transferred.owner{
			test_owner_to = true;
			}
	if  test_transferred.gates == transferred.gates{
			test_gates_to = true;
			}
	if test_transferred.amount == transferred.amount{
			test_amount_to = true;
			}

	let test_transferred_final: bool = false;		
	if test_owner_to == true {
		if test_gates_to == true {
			if test_amount_to == true {
				test_transferred_final = true;
			}
		}
	}

	return test_transferred_final;
}

// Optional functions
// Name      Returns the name of the token.
// Symbol    Returns the symbol of the token, usually a shorter version of the name.
// Decimals  Returns the number of decimals used to get its user representation. For example, if decimals equals 2, a balance of 505 tokens should be displayed //           to a user as 5.05 (505 / 10 ** 2). Tokens usually opt for a value of 18,

//Let's assume we have user A and user B. A has 1000 tokens and want to give permission to B to spend 100 of them.
//    A will call approve(address(B), 100)
//    B will check how many tokens A gave him permission to use by calling allowance(address(A), address(B))
//    B will send to his account these tokens by calling transferFrom(address(A), address(B), 100)

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

@program
// This function tests if it is valid to return a Symbol different from "LEO".
// The parameter `is_dummmy` only exists for sintax purpose.
function test_symbol(is_dummmy: u64) -> bool {
	let letter_L: u64 = 76u64;
	let letter_E: u64 = 69u64;
	let letter_O: u64 = 79u64;
	let zero: u64 = 0u64;
	is_dummmy = zero + is_dummmy;
	letter_L = letter_L + zero;
	letter_E = letter_E + zero;
	letter_O = letter_O + zero;

	let test_letter_L: u64 = 76u64;
	let test_letter_E: u64 = 69u64;
	let test_letter_O: u64 = 79u64;

	let test_symbol_bool: bool = false;
	if test_letter_L == letter_L {
		if test_letter_E == letter_E {
			if test_letter_O == letter_O {	
				test_symbol_bool = true;
			}
		}
	}
    return test_symbol_bool;
}
