local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_PROCESSNAME
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "msaccess.exe"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
  L2_1 = pcall
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_AMSI_CONTENTNAME
  L2_1, L3_1 = L2_1(L3_1, L4_1)
  if L2_1 and L3_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = ".accdb"
    L8_1 = -6
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
