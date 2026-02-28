local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L0_1 = L0_1(L1_1)
  if L0_1 == true then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
    L0_1 = L0_1(L1_1)
    if L0_1 == true then
      L0_1 = mp
      L0_1 = L0_1.GetMOTWZone
      L0_1 = L0_1()
      if L0_1 and 3 <= L0_1 then
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "//LUA:ArchiveWithMotw"
        L1_1(L2_1)
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
