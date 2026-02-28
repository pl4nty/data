local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_HAS_MOTW_ADS
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.GetMOTWZone
  L1_1 = L1_1()
  if 3 <= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.UfsSetMetadataBool
    L2_1 = "LUA:XLLWithMotw"
    L3_1 = true
    L1_1(L2_1, L3_1)
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "BM_XLL_MOTW"
    L1_1(L2_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
