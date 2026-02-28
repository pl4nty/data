local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.TimeDateStamp
if L0_1 ~= 0 then
  L0_1 = pehdr
  L0_1 = L0_1.TimeDateStamp
  if 1532653568 < L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:TimeStampRange2"
    L0_1(L1_1)
  end
  L0_1 = pehdr
  L0_1 = L0_1.TimeDateStamp
  if 1409613824 < L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:TimeStampRange1"
    L0_1(L1_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
