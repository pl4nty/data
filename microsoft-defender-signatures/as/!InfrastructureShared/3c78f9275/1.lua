local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
L1_1 = L1_1 + 515
if L1_1 < 4096 then
  L1_1 = mp
  L1_1 = L1_1.readu_u32
  L2_1 = L0_1
  L3_1 = hstrlog
  L3_1 = L3_1[1]
  L3_1 = L3_1.VA
  L3_1 = L3_1 + 515
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
L2_1 = L2_1 + 549
if L2_1 < 4096 then
  L2_1 = mp
  L2_1 = L2_1.readu_u32
  L3_1 = L0_1
  L4_1 = hstrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.VA
  L4_1 = L4_1 + 549
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
L3_1 = L3_1 + 605
if L3_1 < 4096 then
  L3_1 = mp
  L3_1 = L3_1.readu_u32
  L4_1 = L0_1
  L5_1 = hstrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.VA
  L5_1 = L5_1 + 605
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
L4_1 = L4_1 + 647
if L4_1 < 4096 then
  L4_1 = mp
  L4_1 = L4_1.readu_u32
  L5_1 = L0_1
  L6_1 = hstrlog
  L6_1 = L6_1[1]
  L6_1 = L6_1.VA
  L6_1 = L6_1 + 647
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
L5_1 = L5_1 + 675
if L5_1 < 4096 then
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = L0_1
  L7_1 = hstrlog
  L7_1 = L7_1[1]
  L7_1 = L7_1.VA
  L7_1 = L7_1 + 675
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
L6_1 = L6_1 + 709
if L6_1 < 4096 then
  L6_1 = mp
  L6_1 = L6_1.readu_u32
  L7_1 = L0_1
  L8_1 = hstrlog
  L8_1 = L8_1[1]
  L8_1 = L8_1.VA
  L8_1 = L8_1 + 709
  L8_1 = L8_1 + 1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    goto lbl_128
  end
end
L6_1 = 8192
::lbl_128::
L7_1 = hstrlog
L7_1 = L7_1[1]
L7_1 = L7_1.VA
L7_1 = L7_1 + 737
if L7_1 < 4096 then
  L7_1 = mp
  L7_1 = L7_1.readu_u32
  L8_1 = L0_1
  L9_1 = hstrlog
  L9_1 = L9_1[1]
  L9_1 = L9_1.VA
  L9_1 = L9_1 + 737
  L9_1 = L9_1 + 1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    goto lbl_146
  end
end
L7_1 = 8192
::lbl_146::
L8_1 = hstrlog
L8_1 = L8_1[1]
L8_1 = L8_1.VA
L8_1 = L8_1 + 819
if L8_1 < 4096 then
  L8_1 = mp
  L8_1 = L8_1.readu_u32
  L9_1 = L0_1
  L10_1 = hstrlog
  L10_1 = L10_1[1]
  L10_1 = L10_1.VA
  L10_1 = L10_1 + 819
  L10_1 = L10_1 + 1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 then
    goto lbl_164
  end
end
L8_1 = 8192
::lbl_164::
L9_1 = hstrlog
L9_1 = L9_1[1]
L9_1 = L9_1.VA
L9_1 = L9_1 + 883
if L9_1 < 4096 then
  L9_1 = mp
  L9_1 = L9_1.readu_u32
  L10_1 = L0_1
  L11_1 = hstrlog
  L11_1 = L11_1[1]
  L11_1 = L11_1.VA
  L11_1 = L11_1 + 883
  L11_1 = L11_1 + 1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    goto lbl_182
  end
end
L9_1 = 8192
::lbl_182::
L10_1 = hstrlog
L10_1 = L10_1[1]
L10_1 = L10_1.VA
L10_1 = L10_1 + 935
if L10_1 < 4096 then
  L10_1 = mp
  L10_1 = L10_1.readu_u32
  L11_1 = L0_1
  L12_1 = hstrlog
  L12_1 = L12_1[1]
  L12_1 = L12_1.VA
  L12_1 = L12_1 + 935
  L12_1 = L12_1 + 1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 then
    goto lbl_200
  end
end
L10_1 = 8192
::lbl_200::
L11_1 = hstrlog
L11_1 = L11_1[1]
L11_1 = L11_1.VA
L11_1 = L11_1 + 991
if L11_1 < 4096 then
  L11_1 = mp
  L11_1 = L11_1.readu_u32
  L12_1 = L0_1
  L13_1 = hstrlog
  L13_1 = L13_1[1]
  L13_1 = L13_1.VA
  L13_1 = L13_1 + 991
  L13_1 = L13_1 + 1
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 then
    goto lbl_218
  end
end
L11_1 = 8192
::lbl_218::
if L1_1 == 117450240 and L2_1 == 27392 and L3_1 == 3758153472 and L4_1 == 1728067328 and L5_1 == 4278204416 and L6_1 == 3774888704 and L7_1 == 1627409664 and L8_1 == 1593886720 and L9_1 == 3842003712 and L10_1 == 1593886720 and L11_1 == 1627409664 then
  L12_1 = mp
  L12_1 = L12_1.INFECTED
  return L12_1
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
