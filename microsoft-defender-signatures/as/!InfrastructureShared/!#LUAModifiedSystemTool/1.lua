local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
  L2_1 = L2_1.CONTEXT_DATA_FILEPATH
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_FILENAME
  L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == "narrator.exe" then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = L1_1
    L6_1 = -9
    L4_1 = L4_1(L5_1, L6_1)
    L3_1 = L3_1(L4_1)
    if L3_1 == "\\system32" or L3_1 == "\\syswow64" then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "BM_MODIFIED_SYSTEM_TOOL"
      L4_1(L5_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
