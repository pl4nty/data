local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 5 <= L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[7]
  L0_1 = L0_1.matched
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "HSTR:TrojanProxy:Win32/Banker.BD"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
