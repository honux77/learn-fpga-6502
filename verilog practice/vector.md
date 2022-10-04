# 벡터

벡터는 하나의 이름으로 관련 신호를 묶을 수 있다.

```verilog
wire [7:0] w; //8비트 와이어 생성
```

## 선언

```verilog
//type [upper:lower] name;
wire [7:0] w;
reg [4:1] r;
input wire [3:-2] z; //6bit wire input
wire [0:7] b; //big endian b[0] is msb
```

- 같은 엔디안으로 통일해서 사용하는 것이 좋다.

## 주의

```verilog
wire [2:0] a, c;   // Two vectors
assign a = 3'b101;  // a = 101
assign b = a;       // b =   1  implicitly-created wire
assign c = b;       // c = 001  <-- bug
my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.
                    // This could be a bug if the port was intended to be a vector.
```

## packed vs unpacked

```verilog
reg [7:0] mem [255:0];   // 256 unpacked elements, each of which is a 8-bit packed vector of reg.
reg mem2 [28:0];         // 29 unpacked elements, each of which is a 1-bit reg.
```