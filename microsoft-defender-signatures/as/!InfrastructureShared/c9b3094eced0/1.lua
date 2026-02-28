local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L0_1 = L0_1.ppid
L1_1 = nil
if L0_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.GetProcessCommandLine
  L3_1 = L0_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  if L1_1 == nil then
    L2_1 = string
    L2_1 = L2_1.len
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 <= 4 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
  L2_1 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|.js|.vbs|.wsf|.jse|.vbe|"
  L3_1 = bm_AddRelatedFileFromCommandLine
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1(L4_1, L5_1)
  L3_1 = this_sigattrlog
  L3_1 = L3_1[6]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[6]
    L3_1 = L3_1.utf8p2
    L4_1 = bm_AddRelatedFileFromCommandLine
    L5_1 = L3_1
    L6_1 = L2_1
    L4_1(L5_1, L6_1)
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
