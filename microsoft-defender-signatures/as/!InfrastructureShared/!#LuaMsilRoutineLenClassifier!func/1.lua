local L0_1, L1_1
L0_1 = pe
L0_1 = L0_1.get_netmetadata
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "Lua:MsilRoutineLenClassifier"
  L0_1(L1_1)
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
