local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
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
      L1_1 = L1_1.getfilename
      L2_1 = mp
      L2_1 = L2_1.bitor
      L3_1 = mp
      L3_1 = L3_1.FILEPATH_QUERY_FNAME
      L4_1 = mp
      L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
      L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1, L4_1)
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L1_1
      L4_1 = -4
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 ~= ".msi" then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = 3759263696
      L3_1 = mp
      L3_1 = L3_1.readu_u32
      L4_1 = headerpage
      L5_1 = 1
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 == L2_1 then
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
