
## Assertion Types

There are three kinds of assertions suppoerted by SVA.

- Immediate Assertion
- Concurrent Assertion
- Deffered Assertion


**Immediate Assertions**
- Simple non-temporal domain assertions that are executed like statements in a procedural block,
- Interpreted the same way as an expression in the conditional of a procedural `if` statement,
- Can be specified only where a procedural statement is specified.

**Concurrent Assertions**

- These are temporal domain assertions that allow creation of complex sequences using clock (sampling edge) based semantics.
- They are edge sensitive and not level sensitive. In other words, they must have a `sampling edge` on which it can sample the values of variables used in a sequence or a property.

**Deferred Assertions**

Deferred assertions are a type of Immediate assertions. Note that immediate
assertions evaluate immediately without waiting for variables in its
combinatorial expression to settle down. This also means that the immediate
assertions are very prone to glitches as the combinatorial expression settles
down and may fire multiple times. On the other hand, deferred assertions do not
evaluate their sequence expression until the end of time stamp when all values
have settled down (or in the reactive region of the time stamp). 

## Immediate Assertion

From syntax point of view, an immediate assertion uses only `assert` as the
keyword in contrast to a concurrent assertion that requires `assert property`.

One key difference between immediate and concurrent assertions is that
concurrent assertions always work off of the sampled value in preponed region of
a simulation tick while immediate assertions work immediately when they are
executed (as any combinatorial expression in a procedural block) and do not
evaluate its expression in the preponed region.

There are three types of immediate assertions:

```verilog
immediate assert
immediate assume
immediate cover
```

Note that an immediate assertion cannot be used in a continuous assignment
statement because continuous assign is not a procedural block.

## Concurrent assertions

Concurrent assertions are temporal domain assertions that allow creation of
complex sequences which are based on clock (sampling) edge semantics. This is in
contrast to the immediate assertions that are purely combinatorial and do not
allow temporal domain sequences.

Concurrent assertions are the gist of SVA language. They are called concurrent
because they execute in parallel with the rest of the design logic and are
multi-threaded.


```verilog
sequence sq1;
  req ##2 gnt;
endsequence


property prt1;
  @(posedge clk) cStart |-> sr1;
endproperty


reqGnt: assert property(prt1) $display($time,,,"\t\t %m PASS") else
                              $display($time,,,"\t\t %m FAIL");
```

The condition under which an assertion will be fired is called an *antecedent*.
This is the LHS of the implication operator.

RHS of the assertion that executes once the antecedent matches is called the
*consequent*.

The way to *read* the implication operator is "if there is a match on the ante-
cedent that the consequent will be executed". If there is no match, consequent
will not fire and the assertion will continue to wait for a match on the
antecedent. The *implication* operator also determines the time duration that
will lapse between the antecedent match and the consequent execution. In other
words, the implication operator ties the antecedent and the consequent in one of
two ways. It ties them with an *overlapping* implication operator or a
*non-overlapping* implication operator.


Following types are not allowed for the variables used in a Boolean Expression:

- dynamic Arrays
- class
- strings
- event
- real, shortreal, realtime
- associative Arrays
- chandle


it is always best to break down a property into smaller sequences to model
complex properties/sequences.

## Concurrent assertions Webinar Doulos

`assert` property must hold in every cycle

`cover` property must hold at least once

`assume` a constraint on the inputs for formal
         equivalent to assert for simulation

`restrict` a constraint on the inputs for formal
           ignored by simulation


- Label are optional but very useful
- Every concurrent assertion must have a **sampling event**, typically posedge
or negedge of the clock
- Assertions can have more than one sampling event called multiclock assertions
- Abort condition, names signals that mean that the assertion is no longer need
  to be check (for example a reset).
- Implication operator

```verilog
label: assert property ( @(posedge clk) disable iff (reset) antecedent |-> consequent)
else $error("Failed with consequent = ", $sampled(consequent));
```

### Single cycle properties

- Implication
- Boolean expression

```verilog
assert property ( @(posedge clock) write |-> ready);
assert property ( @(posedge clock) !(read && write));
```

### Temporal operators

`->` Implication operator
`=>` Non overlaping implication operator


```verilog
// This two are equivalent
request |=> grant
request |-> ##1 grant
```






