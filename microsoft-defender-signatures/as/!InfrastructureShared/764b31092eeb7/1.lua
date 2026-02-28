local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = IsSenseRelatedProc
L0_1 = L0_1()
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = "svchost.exe"
L2_1 = "microsoft"
L3_1 = "\\installer\\"
L4_1 = "\\appdata\\"
L5_1 = "Windows\\System32\\spoolsv.exe"
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
L0_1[4] = L4_1
L0_1[5] = L5_1
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
if L1_1 then
  L2_1 = contains
  L3_1 = L1_1
  L4_1 = L0_1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[7]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[7]
  L2_1 = L3_1.utf8p2
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[8]
    L2_1 = L3_1.utf8p2
  end
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = "c:\\\\programdata\\\\microsoft\\\\windows defender.*(\\.exe|\\.sys|\\.dll|\\.mui)(_bak)?$|c:\\\\.*\\\\microsoft\\\\windows defender advanced threat protection\\\\.*(\\.exe|\\.sys|\\.dll|\\.mui)(_bak)?$"
L4_1 = "c:\\\\programdata\\\\microsoft(_bak)?$|c:\\\\program files\\\\windows defender advanced threat protection(_bak)?$"
L5_1 = "c:\\\\programdata\\\\microsoft(_bak)?\\\\windows defender\\\\platform(\\\\)?([^\\\\]+)\\\\?$|c:\\\\programdata\\\\microsoft(_bak)?\\\\windows defender(\\\\)?$"
L6_1 = MpCommon
L6_1 = L6_1.StringRegExpSearch
L7_1 = L3_1
L8_1 = L2_1
L6_1 = L6_1(L7_1, L8_1)
if not L6_1 then
  L6_1 = MpCommon
  L6_1 = L6_1.StringRegExpSearch
  L7_1 = L4_1
  L8_1 = L2_1
  L6_1 = L6_1(L7_1, L8_1)
  if not L6_1 then
    L6_1 = MpCommon
    L6_1 = L6_1.StringRegExpSearch
    L7_1 = L5_1
    L8_1 = L2_1
    L6_1 = L6_1(L7_1, L8_1)
    if not L6_1 then
      goto lbl_166
    end
  end
end
L6_1 = bm
L6_1 = L6_1.add_related_string
L7_1 = "MDE_Path"
L8_1 = L2_1
L9_1 = bm
L9_1 = L9_1.RelatedStringBMReport
L6_1(L7_1, L8_1, L9_1)
L6_1 = add_parents
L6_1 = L6_1()
if not L6_1 then
  L6_1 = {}
end
L7_1 = bm
L7_1 = L7_1.get_current_process_startup_info
L7_1 = L7_1()
if L7_1 then
  L8_1 = L7_1.ppid
  if L8_1 then
    L8_1 = checkParentCmdlineCaseInsensitive
    L9_1 = L7_1.ppid
    L10_1 = {}
    L11_1 = {}
    L12_1 = "setup.exe"
    L13_1 = ""
    L11_1[1] = L12_1
    L11_1[2] = L13_1
    L10_1[1] = L11_1
    L11_1 = 3
    L8_1 = L8_1(L9_1, L10_1, L11_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
  end
end
L8_1 = bm
L8_1 = L8_1.add_related_string
L9_1 = "Parents"
L10_1 = safeJsonSerialize
L11_1 = L6_1
L10_1 = L10_1(L11_1)
L11_1 = bm
L11_1 = L11_1.RelatedStringBMReport
L8_1(L9_1, L10_1, L11_1)
L8_1 = string
L8_1 = L8_1.find
L9_1 = L2_1
L10_1 = "advanced threat protection"
L11_1 = 1
L12_1 = true
L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
if not L8_1 then
  L8_1 = bm
  L8_1 = L8_1.add_related_string
  L9_1 = "AV"
  L10_1 = "True"
  L11_1 = bm
  L11_1 = L11_1.RelatedStringBMReport
  L8_1(L9_1, L10_1, L11_1)
  L8_1 = MpCommon
  L8_1 = L8_1.PathToWin32Path
  L9_1 = L1_1
  L8_1 = L8_1(L9_1)
  L1_1 = L8_1
  if L1_1 then
    L8_1 = contains
    L9_1 = L1_1
    L10_1 = {}
    L11_1 = "C:\\ProgramData\\"
    L12_1 = "C:\\Program Files"
    L13_1 = "c:\\windows\\"
    L10_1[1] = L11_1
    L10_1[2] = L12_1
    L10_1[3] = L13_1
    L8_1 = L8_1(L9_1, L10_1)
    if not L8_1 then
      L8_1 = bm
      L8_1 = L8_1.trigger_sig
      L9_1 = "MpTamperPFRO_Susp"
      L10_1 = L2_1
      L8_1(L9_1, L10_1)
    end
  end
end
L8_1 = mp
L8_1 = L8_1.INFECTED
do return L8_1 end
::lbl_166::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
