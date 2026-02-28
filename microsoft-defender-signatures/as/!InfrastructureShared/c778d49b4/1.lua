local L0_1, L1_1, L2_1
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
L1_1 = pehdr
L1_1 = L1_1.SizeOfImage
if 786432 <= L1_1 then
  L1_1 = pehdr
  L1_1 = L1_1.SizeOfImage
  if L1_1 <= 851968 then
    goto lbl_40
  end
end
L1_1 = pehdr
L1_1 = L1_1.SizeOfImage
if 479232 <= L1_1 then
  L1_1 = pehdr
  L1_1 = L1_1.SizeOfImage
  if L1_1 <= 520192 then
    goto lbl_40
  end
end
L1_1 = pehdr
L1_1 = L1_1.SizeOfImage
if 589824 <= L1_1 then
  L1_1 = pehdr
  L1_1 = L1_1.SizeOfImage
  ::lbl_40::
  if L1_1 <= 606208 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.changedetectionname
L2_1 = 805306378
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.SUSPICIOUS
return L1_1
