local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = false
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.command_line
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L1_1.command_line
    L2_1 = L2_1(L3_1)
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "%.cpl:"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L0_1 = true
      L3_1 = bm
      L3_1 = L3_1.add_related_string
      L4_1 = "CmdLine"
      L5_1 = L2_1
      L6_1 = bm
      L6_1 = L6_1.RelatedStringBMReport
      L3_1(L4_1, L5_1, L6_1)
    end
    L3_1 = IsDetectionThresholdMet
    L4_1 = L1_1.ppid
    L3_1 = L3_1(L4_1)
    if L3_1 then
      L0_1 = true
      L3_1 = bm
      L3_1 = L3_1.add_related_string
      L4_1 = "IsDetectionThresholdMet"
      L5_1 = "true"
      L6_1 = bm
      L6_1 = L6_1.RelatedStringBMReport
      L3_1(L4_1, L5_1, L6_1)
    end
  end
end
L2_1 = bm
L2_1 = L2_1.get_process_relationships
L2_1, L3_1 = L2_1()
L4_1 = ipairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = L8_1.cmd_line
  if L9_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    L9_1 = L10_1
    L11_1 = L9_1
    L10_1 = L9_1.find
    L12_1 = "%.cpl:"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 then
      L10_1 = bm
      L10_1 = L10_1.add_related_process
      L11_1 = L8_1.ppid
      L10_1(L11_1)
      L0_1 = true
      L10_1 = bm
      L10_1 = L10_1.add_related_string
      L11_1 = "ParentCmdLine"
      L12_1 = L9_1
      L13_1 = bm
      L13_1 = L13_1.RelatedStringBMReport
      L10_1(L11_1, L12_1, L13_1)
    end
  end
end
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = L8_1.cmd_line
  if L9_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    L9_1 = L10_1
    L11_1 = L9_1
    L10_1 = L9_1.find
    L12_1 = "%.cpl:"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 then
      L10_1 = bm
      L10_1 = L10_1.add_related_process
      L11_1 = L8_1.ppid
      L10_1(L11_1)
      L0_1 = true
      L10_1 = bm
      L10_1 = L10_1.add_related_string
      L11_1 = "ChildCmdLine"
      L12_1 = L9_1
      L13_1 = bm
      L13_1 = L13_1.RelatedStringBMReport
      L10_1(L11_1, L12_1, L13_1)
    end
  end
end
if L0_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
