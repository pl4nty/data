local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_AMSI_APPNAME
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L1_1 and L2_1 then
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_AMSI_OPERATION_PPID
    L3_1 = L3_1(L4_1)
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = mp
    L5_1 = L5_1.GetProcessCommandLine
    L6_1 = L3_1
    L5_1, L6_1, L7_1, L8_1, L9_1 = L5_1(L6_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
    L5_1 = StringEndsWith
    L6_1 = L4_1
    L7_1 = ".js"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = contains
      L6_1 = L4_1
      L7_1 = {}
      L8_1 = "\\downloads\\"
      L9_1 = "\\appdata\\local\\temp\\"
      L7_1[1] = L8_1
      L7_1[2] = L9_1
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
