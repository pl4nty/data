local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if 327680 <= L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if L0_1 <= 983040 then
    goto lbl_17
  end
end
L0_1 = pehdr
L0_1 = L0_1.SizeOfImage
if 2097152 <= L0_1 then
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  ::lbl_17::
  if L0_1 <= 3473408 then
    L0_1 = mp
    L0_1 = L0_1.GetHSTRCallerId
    L0_1 = L0_1()
    if L0_1 == nil then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.HSTR_CALLER_SMS
    if L1_1 == L0_1 then
      L1_1 = mp
      L1_1 = L1_1.LOWFI
      return L1_1
    end
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.changedetectionname
L1_1 = 805306390
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
