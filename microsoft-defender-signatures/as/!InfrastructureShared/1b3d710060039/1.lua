local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  if not L2_1 then
    L2_1 = ""
  end
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\windows\\sys"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == "iscsicpl.exe" then
      L2_1 = mp
      L2_1 = L2_1.GetParentProcInfo
      L3_1 = L0_1.ppid
      L2_1 = L2_1(L3_1)
      L3_1 = isnull
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = IsKeyInRollingQueue
        L4_1 = "iscsicpl_bypass"
        L5_1 = L2_1.ppid
        L6_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1)
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.GetProcessCommandLine
          L4_1 = L2_1.ppid
          L3_1 = L3_1(L4_1)
          if L3_1 then
            L4_1 = set_research_data
            L5_1 = "PossibleTrigger"
            L6_1 = L3_1
            L7_1 = false
            L4_1(L5_1, L6_1, L7_1)
            L4_1 = mp
            L4_1 = L4_1.INFECTED
            return L4_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
