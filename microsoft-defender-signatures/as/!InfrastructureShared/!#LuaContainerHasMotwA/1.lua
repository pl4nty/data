local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.GetMOTWZone
  L0_1 = L0_1()
  if 3 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.UfsSetMetadataBool
    L1_1 = "Lua:ContainerHasMotw.A"
    L2_1 = true
    L0_1(L1_1, L2_1)
    L0_1 = mp
    L0_1 = L0_1.getfilesize
    L0_1 = L0_1()
    if L0_1 < 1024 then
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "LuaZipWithSingleJS"
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "MpForceScanArchives"
        L1_1(L2_1)
      end
    end
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
