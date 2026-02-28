local L0_1, L1_1, L2_1, L3_1
L0_1 = nri
L0_1 = L0_1.GetURI
L0_1 = L0_1()
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "?auth_signature=([a-f0-9]+)"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if L2_1 == 32 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
