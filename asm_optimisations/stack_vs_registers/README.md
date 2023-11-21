# Comparing Reginster only app to registers and stack

## Brief

We are testing the following program:
``` C
int sum = 0;

for(int counter=0xfffffff; counter>0; counter--)
{
    sum += counter;
}
```

Under `registers` dir, there is an implementation of registers only. No stack is used.  
Under `stack` dir, same program is implemented using stack.

We will compare both programs using time utility:
``` bash 
time ./app
```

## Results

### With stack
``` bash
time ./app

real    1m5.384s
user    1m5.300s
sys     0m0.004s
```

### Registers only
``` bash
time ./app

real    0m14.468s
user    0m14.386s
sys     0m0.008s
```

