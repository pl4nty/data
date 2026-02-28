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
L1_1 = L1_1 + 329
if L1_1 < 4096 then
  L1_1 = mp
  L1_1 = L1_1.readu_u32
  L2_1 = L0_1
  L3_1 = hstrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.VA
  L3_1 = L3_1 + 329
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
L2_1 = L2_1 + 381
if L2_1 < 4096 then
  L2_1 = mp
  L2_1 = L2_1.readu_u32
  L3_1 = L0_1
  L4_1 = hstrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.VA
  L4_1 = L4_1 + 381
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
L3_1 = L3_1 + 609
if L3_1 < 4096 then
  L3_1 = mp
  L3_1 = L3_1.readu_u32
  L4_1 = L0_1
  L5_1 = hstrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.VA
  L5_1 = L5_1 + 609
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
L4_1 = L4_1 + 819
if L4_1 < 4096 then
  L4_1 = mp
  L4_1 = L4_1.readu_u32
  L5_1 = L0_1
  L6_1 = hstrlog
  L6_1 = L6_1[1]
  L6_1 = L6_1.VA
  L6_1 = L6_1 + 819
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
L5_1 = L5_1 + 843
if L5_1 < 4096 then
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = L0_1
  L7_1 = hstrlog
  L7_1 = L7_1[1]
  L7_1 = L7_1.VA
  L7_1 = L7_1 + 843
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
L6_1 = L6_1 + 971
if L6_1 < 4096 then
  L6_1 = mp
  L6_1 = L6_1.readu_u32
  L7_1 = L0_1
  L8_1 = hstrlog
  L8_1 = L8_1[1]
  L8_1 = L8_1.VA
  L8_1 = L8_1 + 971
  L8_1 = L8_1 + 1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    goto lbl_128
  end
end
L6_1 = 8192
::lbl_128::
if L1_1 == 3842003712 and L2_1 == 117450240 and L3_1 == 3372260352 and L4_1 == 1442882048 and L5_1 == 3758109952 and L6_1 == 3422588416 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
