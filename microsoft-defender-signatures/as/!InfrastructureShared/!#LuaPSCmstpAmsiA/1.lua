local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1.image_path
  L2_1 = L2_1(L3_1)
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = mp
  L4_1 = L4_1.GetProcessCommandLine
  L5_1 = L1_1.ppid
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
  if L2_1 and L3_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L2_1
    L6_1 = "\\system32\\dllhost.exe"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "{3e5fc7f9-9a51-4367-9063-a120244fbec7}"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
  L4_1 = mp
  L4_1 = L4_1.GetParentProcInfo
  L5_1 = L1_1.ppid
  L4_1 = L4_1(L5_1)
  if L4_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1.image_path
    L5_1 = L5_1(L6_1)
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = mp
    L7_1 = L7_1.GetProcessCommandLine
    L8_1 = L4_1.ppid
    L7_1, L8_1, L9_1, L10_1, L11_1 = L7_1(L8_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
    if L5_1 and L6_1 then
      L7_1 = string
      L7_1 = L7_1.find
      L8_1 = L5_1
      L9_1 = "\\system32\\dllhost.exe"
      L10_1 = 1
      L11_1 = true
      L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
      if L7_1 then
        L7_1 = string
        L7_1 = L7_1.find
        L8_1 = L6_1
        L9_1 = "{3e5fc7f9-9a51-4367-9063-a120244fbec7}"
        L10_1 = 1
        L11_1 = true
        L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
        if L7_1 then
          L7_1 = mp
          L7_1 = L7_1.INFECTED
          return L7_1
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
