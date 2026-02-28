local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 3500 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_SCANREASON
  L1_1 = L1_1(L2_1)
  L2_1 = mp
  L2_1 = L2_1.SCANREASON_AMSI
  if L1_1 == L2_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
    L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "powershell"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = pcall
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_AMSI_APPNAME
      L3_1, L4_1 = L3_1(L4_1, L5_1)
      if L3_1 then
        L5_1 = pcall
        L6_1 = mp
        L6_1 = L6_1.get_contextdata
        L7_1 = mp
        L7_1 = L7_1.CONTEXT_DATA_AMSI_CONTENTNAME
        L5_1, L6_1 = L5_1(L6_1, L7_1)
        if L5_1 and L6_1 == nil then
          L7_1 = mp
          L7_1 = L7_1.INFECTED
          return L7_1
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
