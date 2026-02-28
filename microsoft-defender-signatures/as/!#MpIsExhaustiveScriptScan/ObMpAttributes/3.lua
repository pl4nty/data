local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILENAME
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = #L0_1
  if 0 < L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.sub
    L3_1 = -7
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    if L1_1 == ".config" then
      L1_1 = mp
      L1_1 = L1_1.BMSearchFile
      L2_1 = 0
      L3_1 = 32
      L4_1 = "# Software Configuration File\144\000"
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 ~= -1 then
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "Lua:SoftEtherConfigScan"
        L1_1(L2_1)
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
