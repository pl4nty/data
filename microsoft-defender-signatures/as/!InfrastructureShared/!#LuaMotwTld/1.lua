local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.GetMOTWHostUrl
L0_1 = L0_1()
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.match
  L3_1 = "https?://.-%.(%a+)/"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:MotwTld_"
    L4_1 = L1_1
    L3_1 = L3_1 .. L4_1
    L2_1(L3_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
