local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = 0
L1_1 = hstrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if L3_1 < 4096 then
  L3_1 = mp
  L3_1 = L3_1.getfilesize
  L3_1 = L3_1()
  if L3_1 then
    goto lbl_56
  end
end
L3_1 = 4096
::lbl_56::
L1_1 = L1_1(L2_1, L3_1)
if 4096 > 60 then
  L2_1 = mp
  L2_1 = L2_1.readu_u32
  L3_1 = L1_1
  L4_1 = 61
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    goto lbl_67
  end
end
L2_1 = 8192
::lbl_67::
L3_1 = L2_1 + 11
if L3_1 < 4096 then
  L3_1 = mp
  L3_1 = L3_1.readu_u16
  L4_1 = L1_1
  L5_1 = L2_1 + 11
  L5_1 = L5_1 + 1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    goto lbl_79
  end
end
L3_1 = 8192
::lbl_79::
L4_1 = mp
L4_1 = L4_1.getfilesize
L4_1 = L4_1()
if L4_1 < 1400000 then
  L4_1 = mp
  L4_1 = L4_1.getfilesize
  L4_1 = L4_1()
  if 800000 < L4_1 and L0_1 == 6 then
    L4_1 = hstrlog
    L4_1 = L4_1[7]
    L4_1 = L4_1.VA
    L5_1 = pehdr
    L5_1 = L5_1.ImageBase
    L5_1 = 64 + L5_1
    if L4_1 == L5_1 and L3_1 == 89 then
      L4_1 = hstrlog
      L4_1 = L4_1[8]
      L4_1 = L4_1.VA
      L5_1 = pehdr
      L5_1 = L5_1.ImageBase
      L5_1 = 600 + L5_1
      if L4_1 >= L5_1 then
        L4_1 = hstrlog
        L4_1 = L4_1[8]
        L4_1 = L4_1.VA
        L5_1 = pehdr
        L5_1 = L5_1.ImageBase
        L5_1 = 700 + L5_1
        if L4_1 <= L5_1 then
          L4_1 = mp
          L4_1 = L4_1.INFECTED
          return L4_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
