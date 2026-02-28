local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = mp
L1_1 = L1_1.IsHipsRuleEnabled
L2_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = GetDetectionThresholdMetReason
  L2_1 = L0_1.ppid
  L1_1, L2_1 = L1_1(L2_1)
  if L1_1 and L2_1 ~= 2 then
    L3_1 = bm_AddRelatedFileFromCommandLine
    L4_1 = L0_1.command_line
    L5_1 = nil
    L6_1 = nil
    L7_1 = 1
    L3_1(L4_1, L5_1, L6_1, L7_1)
    L3_1 = bm
    L3_1 = L3_1.get_process_relationships
    L3_1, L4_1 = L3_1()
    L5_1 = ipairs
    L6_1 = L3_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = L9_1.cmd_line
      if L10_1 ~= nil then
        L10_1 = string
        L10_1 = L10_1.lower
        L11_1 = L9_1.cmd_line
        L10_1 = L10_1(L11_1)
        L12_1 = L10_1
        L11_1 = L10_1.find
        L13_1 = "\\lenovo"
        L14_1 = 1
        L15_1 = true
        L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
        if not L11_1 then
          L12_1 = L10_1
          L11_1 = L10_1.find
          L13_1 = "\\eset\\bts.session"
          L14_1 = 1
          L15_1 = true
          L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
          if not L11_1 then
            L12_1 = L10_1
            L11_1 = L10_1.find
            L13_1 = "\\tanium"
            L14_1 = 1
            L15_1 = true
            L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
            if not L11_1 then
              goto lbl_68
            end
          end
        end
        L11_1 = mp
        L11_1 = L11_1.CLEAN
        return L11_1
      end
      ::lbl_68::
    end
    L5_1 = ipairs
    L6_1 = L4_1
    L5_1, L6_1, L7_1 = L5_1(L6_1)
    for L8_1, L9_1 in L5_1, L6_1, L7_1 do
      L10_1 = mp
      L10_1 = L10_1.bitand
      L11_1 = L9_1.reason_ex
      L12_1 = bm
      L12_1 = L12_1.RELATIONSHIP_INJECTION
      L10_1 = L10_1(L11_1, L12_1)
      L11_1 = bm
      L11_1 = L11_1.RELATIONSHIP_INJECTION
      if L10_1 == L11_1 then
        L11_1 = bm
        L11_1 = L11_1.add_threat_process
        L12_1 = L9_1.ppid
        L11_1(L12_1)
      end
    end
    L5_1 = AddResearchData
    L6_1 = L0_1.ppid
    L7_1 = true
    L5_1(L6_1, L7_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
