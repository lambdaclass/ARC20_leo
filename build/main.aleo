program arc20_leo.aleo;

record balance:
    owner as address.private;
    gates as u64.private;
    amount as u64.private;


function approve:
    input r0 as address.private;
    input r1 as u64.private;
    input r2 as address.private;
    input r3 as u64.private;
    gte r1 r3 into r4;
    ternary r4 true false into r5;
    output r5 as boolean.private;

function test_approve:
    input r0 as address.private;
    input r1 as u64.private;
    input r2 as address.private;
    input r3 as u64.private;
    gte r1 r3 into r4;
    ternary r4 true false into r5;
    is.eq r5 true into r6;
    ternary r6 true false into r7;
    output r7 as boolean.private;

function allowance:
    input r0 as address.private;
    input r1 as address.private;
    input r2 as balance.record;
    input r3 as u64.private;
    lt r3 r2.amount into r4;
    ternary r4 r3 0u64 into r5;
    output r5 as u64.private;

function test_allowance:
    input r0 as address.private;
    input r1 as address.private;
    input r2 as balance.record;
    input r3 as u64.private;
    lt r3 r2.amount into r4;
    ternary r4 r3 0u64 into r5;
    is.eq 78u64 r5 into r6;
    ternary r6 true false into r7;
    output r7 as boolean.private;

function transferfrom:
    input r0 as balance.record;
    input r1 as address.private;
    input r2 as address.private;
    input r3 as u64.private;
    input r4 as u64.private;
    input r5 as u64.private;
    sub r0.amount r5 into r6;
    cast r1 r0.gates r6 into r7 as balance.record;
    add r4 r5 into r8;
    output r7 as balance.record;
    output r2 as address.private;
    output r8 as u64.private;
    output r3 as u64.private;

function test_transferfrom:
    input r0 as balance.record;
    input r1 as address.private;
    input r2 as address.private;
    input r3 as u64.private;
    input r4 as u64.private;
    input r5 as u64.private;
    sub r0.amount r5 into r6;
    cast r1 r0.gates r6 into r7 as balance.record;
    add r4 r5 into r8;
    cast r2 r3 r8 into r9 as balance.record;
    cast aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7 0u64 20u64 into r10 as balance.record;
    cast aleo1mgfq6g40l6zkhsm063n3uhr43qk5e0zsua5aszeq5080dsvlcvxsn0rrau 0u64 35u64 into r11 as balance.record;
    is.eq r10.owner r7.owner into r12;
    ternary r12 true false into r13;
    is.eq r10.gates r7.gates into r14;
    ternary r14 true false into r15;
    is.eq r10.amount r7.amount into r16;
    ternary r16 true false into r17;
    is.eq r13 true into r18;
    is.eq r15 true into r19;
    is.eq r17 true into r20;
    ternary r20 true false into r21;
    ternary r19 r21 false into r22;
    ternary r18 r22 false into r23;
    is.eq r11.owner r9.owner into r24;
    ternary r24 true false into r25;
    is.eq r11.gates r9.gates into r26;
    ternary r26 true false into r27;
    is.eq r11.amount r9.amount into r28;
    ternary r28 true false into r29;
    is.eq r25 true into r30;
    is.eq r27 true into r31;
    is.eq r29 true into r32;
    ternary r32 true false into r33;
    ternary r31 r33 false into r34;
    ternary r30 r34 false into r35;
    is.eq r35 true into r36;
    is.eq r23 true into r37;
    ternary r37 true false into r38;
    ternary r36 r38 false into r39;
    output r39 as boolean.private;

function balanceof:
    input r0 as balance.record;
    gte r0.amount 0u64 into r1;
    ternary r1 r0.amount 0u64 into r2;
    output r2 as u64.private;

function test_balanceof:
    input r0 as balance.record;
    gte r0.amount 0u64 into r1;
    ternary r1 r0.amount 0u64 into r2;
    is.eq r2 269u64 into r3;
    ternary r3 true false into r4;
    output r4 as boolean.private;

function total_supply:
    input r0 as u64.private;
    add r0 0u64 into r1;
    output r1 as u64.private;

function test_total_supply:
    input r0 as u64.private;
    add r0 0u64 into r1;
    is.eq r1 1729u64 into r2;
    ternary r2 true false into r3;
    output r3 as boolean.private;

function transfer:
    input r0 as balance.record;
    input r1 as address.private;
    input r2 as u64.private;
    add r0.amount r2 into r3;
    cast r1 r0.gates r3 into r4 as balance.record;
    output r4 as balance.record;

function test_transfer:
    input r0 as balance.record;
    input r1 as address.private;
    input r2 as u64.private;
    add r0.amount r2 into r3;
    cast r1 r0.gates r3 into r4 as balance.record;
    cast aleo1ht2a9q0gsd38j0se4t9lsfulxgqrens2vgzgry3pkvs93xrrzu8s892zn7 0u64 30u64 into r5 as balance.record;
    is.eq r5.owner r4.owner into r6;
    ternary r6 true false into r7;
    is.eq r5.gates r4.gates into r8;
    ternary r8 true false into r9;
    is.eq r5.amount r4.amount into r10;
    ternary r10 true false into r11;
    is.eq r7 true into r12;
    is.eq r9 true into r13;
    is.eq r11 true into r14;
    ternary r14 true false into r15;
    ternary r13 r15 false into r16;
    ternary r12 r16 false into r17;
    output r17 as boolean.private;

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

