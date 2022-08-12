program pruebasleo.aleo;

record balance:
    owner as address.private;
    gates as u64.private;
    amount as u64.private;


function to2:
    input r0 as u64.private;
    output r0 as u64.private;

function mint:
    input r0 as address.private;
    input r1 as u64.private;
    input r2 as u64.private;
    input r3 as u64.private;
    input r4 as balance.record;
    add r2 r1 into r5;
    add r4.amount r1 into r6;
    cast r0 r3 r6 into r7 as balance.record;
    output r7 as balance.record;
    output r5 as u64.private;

function transfer:
    input r0 as balance.record;
    input r1 as address.private;
    input r2 as u64.private;
    sub r0.amount r2 into r3;
    cast r0.owner r0.gates r3 into r4 as balance.record;
    cast r1 0u64 r2 into r5 as balance.record;
    output r4 as balance.record;
    output r5 as balance.record;

function balanceof:
    input r0 as address.private;
    input r1 as u64.private;
    cast r0 20u64 40u64 into r2 as balance.record;
    output r1 as u64.private;

