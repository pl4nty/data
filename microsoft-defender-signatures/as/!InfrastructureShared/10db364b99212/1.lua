local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = IsLegacyOrgMachine
L0_1 = L0_1()
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L0_1 = L0_1.ppid
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.GetProcessCommandLine
  L3_1 = L0_1
  L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
  if L1_1 ~= nil then
    L2_1 = #L1_1
    if 12 < L2_1 then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "\\ubu_statistikautostart.vbs"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= nil then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
    end
  end
end
L1_1 = AddResearchData
L2_1 = "BM"
L3_1 = true
L1_1(L2_1, L3_1)
L1_1 = bm_AddRelatedFileFromCommandLine
L2_1 = "BM"
L3_1 = nil
L4_1 = nil
L5_1 = 6
L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
