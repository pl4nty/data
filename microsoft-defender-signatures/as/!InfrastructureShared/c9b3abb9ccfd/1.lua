local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = 900000000
L1_1 = bm
L1_1 = L1_1.GetSignatureMatchDuration
L1_1 = L1_1()
if L0_1 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L1_1 = L1_1.ppid
L2_1 = nil
if L1_1 ~= nil then
  L3_1 = mp
  L3_1 = L3_1.GetProcessCommandLine
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
end
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  if L2_1 == nil then
    L3_1 = string
    L3_1 = L3_1.len
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 <= 4 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
  end
  L3_1 = nil
  L4_1 = this_sigattrlog
  L4_1 = L4_1[7]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[7]
    L3_1 = L4_1.utf8p1
  end
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = nil
  L5_1 = this_sigattrlog
  L5_1 = L5_1[8]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[8]
    L4_1 = L5_1.utf8p2
  end
  if L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = string
  L5_1 = L5_1.lower
  L6_1 = string
  L6_1 = L6_1.match
  L7_1 = L3_1
  L8_1 = "([^\\]-[^\\%.]+)$"
  L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1, L8_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = L5_1
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|.js|.vbs|.wsf|.jse|.vbe|"
  L7_1 = bm_AddRelatedFileFromCommandLine
  L8_1 = L2_1
  L9_1 = L6_1
  L7_1(L8_1, L9_1)
  L7_1 = this_sigattrlog
  L7_1 = L7_1[6]
  L7_1 = L7_1.matched
  if L7_1 then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[6]
    L7_1 = L7_1.utf8p2
    L8_1 = bm_AddRelatedFileFromCommandLine
    L9_1 = L7_1
    L10_1 = L6_1
    L8_1(L9_1, L10_1)
  end
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
