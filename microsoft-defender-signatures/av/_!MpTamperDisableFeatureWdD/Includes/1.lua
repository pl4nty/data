local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = {}
  L2_1 = {}
  L3_1 = "\\windows\\ccm\\"
  L4_1 = ""
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L3_1 = {}
  L4_1 = ""
  L5_1 = "\\windows\\ccm\\"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L2_1 = checkParentCmdlineCaseInsensitive
  L3_1 = L0_1
  L4_1 = L1_1
  L5_1 = 5
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
