local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "//Lua:NewDiagCabFile"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilename
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L2_1 = L0_1
    L1_1 = L0_1.lower
    L1_1 = L1_1(L2_1)
    L2_1 = L1_1
    L1_1 = L1_1.match
    L3_1 = "%.diagcab%-%>.+%.diagcfg$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
