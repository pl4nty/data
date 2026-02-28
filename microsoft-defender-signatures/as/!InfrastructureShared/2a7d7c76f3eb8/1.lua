local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = L0_1.image_path
  L2_1 = mp
  L2_1 = L2_1.GetProcessCommandLine
  L3_1 = L0_1.ppid
  L2_1 = L2_1(L3_1)
  L3_1 = isnull
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L1_1
      L3_1 = L3_1(L4_1)
      L1_1 = L3_1
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "\\system32\\dllhost.exe"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "{3e5fc7f9-9a51-4367-9063-a120244fbec7}"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.INFECTED
          return L3_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
