load harness

@test "custom-1" {
  check 'x := false ? 1 : 0' '⇒ skip, {x → 0}'
}

@test "custom-2" {
  check 'x := ( y < 1 ) ? ( 3 * -2 ) : 0' '⇒ skip, {x → -6}'
}

@test "custom-3" {
  check 'if x = 0 then x := y < 1 ? x * y + 10 : 0 else x := 1' '⇒ x := (y<1)?((x*y)+10):0, {}
⇒ skip, {x → 10}'
}

@test "custom-4" {
  check 'x := -10 ; while ¬ ( x = 0 ) do x := x < 0 ? x + 1 : x - 1' '⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -10}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -10}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -10}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -9}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -9}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -9}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -8}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -8}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -8}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -7}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -7}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -7}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -6}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -6}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -6}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -5}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -5}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -5}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -4}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -4}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -4}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -3}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -3}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -3}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -2}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -2}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -2}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -1}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -1}
⇒ x := (x<0)?(x+1):(x-1); while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → -1}
⇒ skip; while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → 0}
⇒ while ¬(x=0) do { x := (x<0)?(x+1):(x-1) }, {x → 0}
⇒ skip, {x → 0}'
}

@test "custom-5" {
  check 'x := -10 ; while x < 0 ∧ counter < 100 do { counter := counter + 1 ; x := x < -1 ? x + 1 : x - 10 }' '⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 1, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 1, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 1, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 1, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 1, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 2, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 2, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 2, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 2, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 2, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 3, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 3, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 3, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 3, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 3, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 4, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 4, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 4, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 4, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 4, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 5, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 5, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 5, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 5, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 5, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 6, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 6, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 6, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 6, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 6, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 7, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 7, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 7, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 7, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 7, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 8, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 8, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 8, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 8, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 8, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 9, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 9, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 9, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 9, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 9, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 10, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 10, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 10, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 10, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 10, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 11, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 11, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 11, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 11, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 11, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 12, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 12, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 12, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 12, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 12, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 13, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 13, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 13, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 13, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 13, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 14, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 14, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 14, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 14, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 14, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 15, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 15, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 15, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 15, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 15, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 16, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 16, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 16, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 16, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 16, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 17, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 17, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 17, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 17, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 17, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 18, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 18, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 18, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 18, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 18, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 19, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 19, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 19, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 19, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 19, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 20, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 20, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 20, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 20, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 20, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 21, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 21, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 21, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 21, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 21, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 22, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 22, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 22, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 22, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 22, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 23, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 23, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 23, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 23, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 23, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 24, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 24, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 24, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 24, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 24, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 25, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 25, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 25, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 25, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 25, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 26, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 26, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 26, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 26, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 26, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 27, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 27, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 27, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 27, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 27, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 28, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 28, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 28, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 28, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 28, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 29, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 29, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 29, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 29, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 29, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 30, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 30, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 30, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 30, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 30, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 31, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 31, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 31, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 31, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 31, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 32, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 32, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 32, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 32, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 32, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 33, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 33, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 33, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 33, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 33, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 34, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 34, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 34, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 34, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 34, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 35, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 35, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 35, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 35, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 35, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 36, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 36, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 36, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 36, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 36, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 37, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 37, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 37, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 37, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 37, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 38, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 38, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 38, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 38, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 38, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 39, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 39, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 39, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 39, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 39, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 40, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 40, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 40, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 40, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 40, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 41, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 41, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 41, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 41, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 41, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 42, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 42, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 42, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 42, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 42, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 43, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 43, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 43, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 43, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 43, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 44, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 44, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 44, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 44, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 44, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 45, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 45, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 45, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 45, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 45, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 46, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 46, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 46, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 46, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 46, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 47, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 47, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 47, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 47, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 47, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 48, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 48, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 48, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 48, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 48, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 49, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 49, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 49, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 49, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 49, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 50, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 50, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 50, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 50, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 50, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 51, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 51, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 51, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 51, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 51, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 52, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 52, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 52, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 52, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 52, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 53, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 53, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 53, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 53, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 53, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 54, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 54, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 54, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 54, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 54, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 55, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 55, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 55, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 55, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 55, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 56, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 56, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 56, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 56, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 56, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 57, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 57, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 57, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 57, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 57, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 58, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 58, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 58, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 58, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 58, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 59, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 59, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 59, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 59, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 59, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 60, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 60, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 60, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 60, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 60, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 61, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 61, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 61, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 61, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 61, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 62, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 62, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 62, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 62, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 62, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 63, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 63, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 63, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 63, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 63, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 64, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 64, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 64, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 64, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 64, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 65, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 65, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 65, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 65, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 65, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 66, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 66, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 66, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 66, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 66, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 67, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 67, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 67, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 67, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 67, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 68, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 68, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 68, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 68, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 68, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 69, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 69, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 69, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 69, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 69, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 70, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 70, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 70, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 70, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 70, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 71, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 71, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 71, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 71, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 71, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 72, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 72, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 72, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 72, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 72, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 73, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 73, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 73, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 73, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 73, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 74, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 74, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 74, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 74, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 74, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 75, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 75, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 75, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 75, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 75, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 76, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 76, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 76, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 76, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 76, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 77, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 77, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 77, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 77, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 77, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 78, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 78, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 78, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 78, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 78, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 79, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 79, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 79, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 79, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 79, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 80, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 80, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 80, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 80, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 80, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 81, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 81, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 81, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 81, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 81, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 82, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 82, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 82, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 82, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 82, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 83, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 83, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 83, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 83, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 83, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 84, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 84, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 84, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 84, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 84, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 85, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 85, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 85, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 85, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 85, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 86, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 86, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 86, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 86, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 86, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 87, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 87, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 87, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 87, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 87, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 88, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 88, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 88, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 88, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 88, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 89, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 89, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 89, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 89, x → -9}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 89, x → -9}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 90, x → -9}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 90, x → -9}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 90, x → -8}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 90, x → -8}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 90, x → -8}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 91, x → -8}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 91, x → -8}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 91, x → -7}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 91, x → -7}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 91, x → -7}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 92, x → -7}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 92, x → -7}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 92, x → -6}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 92, x → -6}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 92, x → -6}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 93, x → -6}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 93, x → -6}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 93, x → -5}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 93, x → -5}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 93, x → -5}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 94, x → -5}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 94, x → -5}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 94, x → -4}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 94, x → -4}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 94, x → -4}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 95, x → -4}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 95, x → -4}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 95, x → -3}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 95, x → -3}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 95, x → -3}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 96, x → -3}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 96, x → -3}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 96, x → -2}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 96, x → -2}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 96, x → -2}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 97, x → -2}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 97, x → -2}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 97, x → -1}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 97, x → -1}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 97, x → -1}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 98, x → -1}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 98, x → -1}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 98, x → -11}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 98, x → -11}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 98, x → -11}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 99, x → -11}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 99, x → -11}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 99, x → -10}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 99, x → -10}
⇒ counter := (counter+1); x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 99, x → -10}
⇒ skip; x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 100, x → -10}
⇒ x := (x<-1)?(x+1):(x-10); while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 100, x → -10}
⇒ skip; while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 100, x → -9}
⇒ while ((x<0)∧(counter<100)) do { counter := (counter+1); x := (x<-1)?(x+1):(x-10) }, {counter → 100, x → -9}
⇒ skip, {counter → 100, x → -9}'
}


