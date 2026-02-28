local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.readfile
L1_1 = 0
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
if L2_1 < 4096 then
  L2_1 = mp
  L2_1 = L2_1.getfilesize
  L2_1 = L2_1()
  if L2_1 then
    goto lbl_19
  end
end
L2_1 = 4096
::lbl_19::
L0_1 = L0_1(L1_1, L2_1)
L1_1 = hstrlog
L1_1 = L1_1[1]
L1_1 = L1_1.VA
L1_1 = L1_1 + 163
if L1_1 < 4096 then
  L1_1 = mp
  L1_1 = L1_1.readu_u32
  L2_1 = L0_1
  L3_1 = hstrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.VA
  L3_1 = L3_1 + 163
  L3_1 = L3_1 + 1
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    goto lbl_38
  end
end
L1_1 = 8192
::lbl_38::
L2_1 = hstrlog
L2_1 = L2_1[1]
L2_1 = L2_1.VA
L2_1 = L2_1 + 189
if L2_1 < 4096 then
  L2_1 = mp
  L2_1 = L2_1.readu_u32
  L3_1 = L0_1
  L4_1 = hstrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.VA
  L4_1 = L4_1 + 189
  L4_1 = L4_1 + 1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    goto lbl_56
  end
end
L2_1 = 8192
::lbl_56::
L3_1 = hstrlog
L3_1 = L3_1[1]
L3_1 = L3_1.VA
L3_1 = L3_1 + 303
if L3_1 < 4096 then
  L3_1 = mp
  L3_1 = L3_1.readu_u32
  L4_1 = L0_1
  L5_1 = hstrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.VA
  L5_1 = L5_1 + 303
  L5_1 = L5_1 + 1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    goto lbl_74
  end
end
L3_1 = 8192
::lbl_74::
L4_1 = hstrlog
L4_1 = L4_1[1]
L4_1 = L4_1.VA
L4_1 = L4_1 + 408
if L4_1 < 4096 then
  L4_1 = mp
  L4_1 = L4_1.readu_u32
  L5_1 = L0_1
  L6_1 = hstrlog
  L6_1 = L6_1[1]
  L6_1 = L6_1.VA
  L6_1 = L6_1 + 408
  L6_1 = L6_1 + 1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    goto lbl_92
  end
end
L4_1 = 8192
::lbl_92::
L5_1 = hstrlog
L5_1 = L5_1[1]
L5_1 = L5_1.VA
L5_1 = L5_1 + 420
if L5_1 < 4096 then
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = L0_1
  L7_1 = hstrlog
  L7_1 = L7_1[1]
  L7_1 = L7_1.VA
  L7_1 = L7_1 + 420
  L7_1 = L7_1 + 1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    goto lbl_110
  end
end
L5_1 = 8192
::lbl_110::
L6_1 = hstrlog
L6_1 = L6_1[1]
L6_1 = L6_1.VA
L6_1 = L6_1 + 484
if L6_1 < 4096 then
  L6_1 = mp
  L6_1 = L6_1.readu_u32
  L7_1 = L0_1
  L8_1 = hstrlog
  L8_1 = L8_1[1]
  L8_1 = L8_1.VA
  L8_1 = L8_1 + 484
  L8_1 = L8_1 + 1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    goto lbl_128
  end
end
L6_1 = 8192
::lbl_128::
if L1_1 == 3847464024 and L2_1 == 119961420 and L3_1 == 3382495594 and L4_1 == 1453503984 and L5_1 == 3761631300 and L6_1 == 3431858420 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
