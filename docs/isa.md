# Instruction set

16-bit instructions, 8-bit data, eight 8-bit registers (`r0`–`r7`).
`r0` always reads as zero and ignores writes.

## Formats

```
R-type   15   13 12  10 9    7 6    4 3      0
        [opcode][  rs ][  rt  ][  rd  ][ funct ]

I-type   15   13 12  10 9    7 6               0
        [opcode][  rs ][  rt  ][     imm (7)    ]
```

`imm` is a signed 7-bit value (−64 … 63), sign-extended to 8 bits.

## Opcodes

| Opcode | Mnemonic | Format | Operation                                  | Cycles |
|--------|----------|--------|--------------------------------------------|--------|
| `000`  | `nop`    | –      | –                                          | 3      |
| `001`  | ALU op   | R      | `rd <- rs <funct> rt`                      | 4      |
| `010`  | `beq`    | I      | `if rs == rt: PC <- PC + 1 + imm`          | 3 / 4  |
| `100`  | `addi`   | I      | `rt <- rs + imm`                           | 4      |
| `110`  | `sw`     | I      | `mem[rs + imm] <- rt`                      | 4      |
| `111`  | `lw`     | I      | `rt <- mem[rs + imm]`                      | 4      |

`011` and `101` are unused and execute as `nop`.
For `beq`, `PC` is the address of the branch itself; 3 cycles when not taken, 4 when taken.

## ALU operations (`funct`)

| `funct` | Mnemonic | Result                         |
|---------|----------|--------------------------------|
| `0000`  | `add`    | `rs + rt`                      |
| `0001`  | `sub`    | `rs - rt`                      |
| `0010`  | `and`    | `rs & rt`                      |
| `0011`  | `or`     | `rs \| rt`                     |
| `0100`  | `xor`    | `rs ^ rt`                      |
| `0101`  | `nor`    | `~(rs \| rt)`                  |
| `0110`  | `mulu`   | low 8 bits of `rs * rt`, unsigned |
| `0111`  | `mul`    | low 8 bits of `rs * rt`, signed   |
| `1000`  | `sll`    | `rs << rt`                     |
| `1001`  | `srl`    | `rs >> rt`, logical            |
| `1010`  | `sra`    | `rs >> rt`, arithmetic         |
| `1011`  | `seq`    | `1` if `rs == rt`              |
| `1100`  | `slt`    | `1` if `rs < rt`, signed       |
| `1101`  | `sltu`   | `1` if `rs < rt`, unsigned     |
| `1110`  | `sgt`    | `1` if `rs > rt`, signed       |
| `1111`  | `sgtu`   | `1` if `rs > rt`, unsigned     |

## Encoding example

`sub r5, r3, r4` → opcode `001`, rs `011`, rt `100`, rd `101`, funct `0001`:

```
001 011 100 101 0001  =  0010 1110 0101 0001  =  0x2E51
```

`lw r3, 0(r0)` → opcode `111`, rs `000`, rt `011`, imm `0000000`:

```
111 000 011 0000000  =  1110 0001 1000 0000  =  0xE180
```
