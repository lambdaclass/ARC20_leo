# ARC20_leo

##  About The Project
Implement the 6 mandatory rules in Leo Programming Language so that they can be invoked in a Smart contract.

They are: **BalanceOf**, **TotalSupply**, **Approve**, **TransferFrom**, **Transfer**, **Allowance**.

## Usage

### To run *BalanceOf* function:

Input file ARC20_leo/inputs/arc20_leo.in
```
[balanceof]
owner_balance: Balance = Balance {
    owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
    gates: 0u64,
    amount: 269u64,
    _nonce: 0group,
};
```

`leo run BalanceOf`

Console output.
```
 • Executing 'arc20_leo.aleo/balanceof'...
 • Executed 'balanceof' (in 11642 ms)

➡️  Output

 • 269u64
```

### To run *total_supply* function:

Input file ARC20_leo/inputs/arc20_leo.in
```
[total_supply]
supply: Totalsupply = Totalsupply {
    owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
    gates: 0u64,
    amount: 100u64,
    _nonce: 0group,
};
```

`leo run total_supply`

Console output.
```
 Executing 'arc20_leo.aleo/total_supply'...
 • Executed 'total_supply' (in 6929 ms)

➡️  Output

 • 100u64
```

### To run *Approve* function:

Input file ARC20_leo/inputs/arc20_leo.in
```
[approve]
spender: address = aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7;
balance_owner: Balance = Balance {
    owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
    gates: 0u64,
    amount: 25u64,
    _nonce: 0group,
};
amount_desired: u64 = 78u64;
```

`leo run Approve`

Console output.
```
Executing 'arc20_leo.aleo/approve'...
 • Executed 'approve' (in 11522 ms)

➡️  Output

 • 1u64
```

### To run *TransferFrom* function:

Input file ARC20_leo/inputs/arc20_leo.in
```
[transferfrom]
from_balance: Balance = Balance {
    owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
    gates: 0u64,
    amount: 25u64,
    _nonce: 0group,
};
to_balance: Balance = Balance {
    owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
    gates: 0u64,
    amount: 30u64,
    _nonce: 0group,
};
from: address = aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7;
to: address = aleo1mgfq6g40l6zkhsm063n3uhr43qk5e0zsua5aszeq5080dsvlcvxsn0rrau;
amount: u64 = 5u64;

```
`leo run TransferFrom`

Console output.
```
 • Executing 'arc20_leo.aleo/transferfrom'...
 • Executed 'transferfrom' (in 25958 ms)

➡️  Outputs

 • {
  owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7.private,
  gates: 0u64.private,
  amount: 20u64.private,
  _nonce: 7319105746718276012418590872386307094662097567319760237609466250239982975766group.public
}
 • {
  owner: aleo1mgfq6g40l6zkhsm063n3uhr43qk5e0zsua5aszeq5080dsvlcvxsn0rrau.private,
  gates: 0u64.private,
  amount: 35u64.private,
  _nonce: 3703638944736524862437145381727913907776853442339019267506977963828560008400group.public
}

```

### To run *Transfer* function:

Input file ARC20_leo/inputs/arc20_leo.in
```
[transfer]
to_balance: Balance = Balance {
    owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
    gates: 0u64,
    amount: 25u64,
    _nonce: 0group,
};
to: address = aleo1mgfq6g40l6zkhsm063n3uhr43qk5e0zsua5aszeq5080dsvlcvxsn0rrau;
amount: u64 = 5u64;
```

`leo run Transfer`

Console output.
```

 • Executing 'arc20_leo.aleo/transfer'...
 • Executed 'transfer' (in 14049 ms)

➡️  Output

 • {
  owner: aleo1mgfq6g40l6zkhsm063n3uhr43qk5e0zsua5aszeq5080dsvlcvxsn0rrau.private,
  gates: 0u64.private,
  amount: 30u64.private,
  _nonce: 7052805180512559416001800196496246635472028404101328759122737033680855103535group.public
}
```

### To run *Allowance* function:
Input file ARC20_leo/inputs/arc20_leo.in
```
[allowance]
owner: address = aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7;
spender: address = aleo1mgfq6g40l6zkhsm063n3uhr43qk5e0zsua5aszeq5080dsvlcvxsn0rrau;
balance_owner: Balance = Balance {
    owner: aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7,
    gates: 0u64,
    amount: 250u64,
    _nonce: 0group,
};
amount_desired: u64 = 78u64;

```

`leo run Allowance`

Console output.
```
 • Executing 'arc20_leo.aleo/allowance'...
 • Executed 'allowance' (in 13992 ms)

➡️  Output

 • 1u64
```
