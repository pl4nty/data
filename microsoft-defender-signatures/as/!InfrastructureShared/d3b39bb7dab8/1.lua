local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = bm
  L0_1 = L0_1.get_current_process_startup_info
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L1_1 = L0_1.command_line
    if L1_1 ~= nil then
      L1_1 = string
      L1_1 = L1_1.lower
      L2_1 = L0_1.command_line
      L1_1 = L1_1(L2_1)
      L2_1 = {}
      L2_1["searchindexer.sys"] = true
      L2_1["svchost.exe"] = true
      L2_1["mousocoreworker.exe"] = true
      L2_1["vssvc.exe"] = true
      L2_1["usocoreworker.exe"] = true
      L2_1["klnagent.exe"] = true
      L2_1["adm.exe"] = true
      L4_1 = L1_1
      L3_1 = L1_1.match
      L5_1 = "\\([^\\]+)$"
      L3_1 = L3_1(L4_1, L5_1)
      L4_1 = L2_1[L3_1]
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      end
      L5_1 = L1_1
      L4_1 = L1_1.find
      L6_1 = "\\dell\\"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L5_1 = L1_1
        L4_1 = L1_1.find
        L6_1 = "\\lenovo\\"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          goto lbl_53
        end
      end
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      do return L4_1 end
      ::lbl_53::
      L4_1 = bm_AddRelatedFileFromCommandLine
      L5_1 = L0_1.command_line
      L6_1 = nil
      L7_1 = nil
      L8_1 = 1
      L4_1(L5_1, L6_1, L7_1, L8_1)
      L4_1 = AddResearchData
      L5_1 = L0_1.ppid
      L6_1 = true
      L4_1(L5_1, L6_1)
    end
  end
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
