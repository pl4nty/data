local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.GetMOTWZone
  L0_1 = L0_1()
  if 3 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.UfsSetMetadataBool
    L1_1 = "LUA:ZipRar7ZWithMotw"
    L2_1 = true
    L0_1(L1_1, L2_1)
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "//LUA:ZipRar7ZWithMotw.A"
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
