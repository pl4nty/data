local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 == "firefox.exe" then
      L2_1 = mp
      L2_1 = L2_1.set_mpattribute
      L3_1 = "MpDisableCaching"
      L2_1(L3_1)
      L2_1 = mp
      L2_1 = L2_1.getfilesize
      L2_1 = L2_1()
      if L2_1 < 1000 then
        L3_1 = mp
        L3_1 = L3_1.set_mpattribute
        L4_1 = "MpForceScanArchives"
        L3_1(L4_1)
      end
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
