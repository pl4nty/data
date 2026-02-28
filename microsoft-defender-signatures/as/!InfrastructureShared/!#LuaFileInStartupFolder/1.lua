local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.len
  L1_1 = L1_1(L2_1)
  if 28 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = -28
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == "\\start menu\\programs\\startup" then
      L2_1 = mp
      L2_1 = L2_1.get_mpattribute
      L3_1 = "BM_LNK_FILE"
      L2_1 = L2_1(L3_1)
      if L2_1 then
        L2_1 = mp
        L2_1 = L2_1.set_mpattribute
        L3_1 = "Lua:LnkFileInStartupFolder"
        L2_1(L3_1)
      end
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      return L2_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
