local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 16 or 3145728 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILE_AGE
L1_1 = L1_1(L2_1)
if 300 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1.ntrunkey = true
L2_1.runkey = true
L2_1.runonce = true
L2_1.runonceex = true
L3_1 = mp
L3_1 = L3_1.GetResmgrBasePlugin
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = ""
  if L4_1 then
    goto lbl_35
  end
end
L4_1 = L3_1
::lbl_35::
L5_1 = L4_1
L4_1 = L4_1.lower
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = L2_1[L3_1]
if L4_1 ~= true then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_FILEPATH
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
if L4_1 == nil then
  L5_1 = ""
  if L5_1 then
    goto lbl_58
  end
end
L5_1 = L4_1
::lbl_58::
L6_1 = L5_1
L5_1 = L5_1.lower
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = MpCommon
L5_1 = L5_1.ExpandEnvironmentVariables
L6_1 = "%programfiles%"
L5_1 = L5_1(L6_1)
if L5_1 == nil then
  L6_1 = ""
  if L6_1 then
    goto lbl_71
  end
end
L6_1 = L5_1
::lbl_71::
L7_1 = L6_1
L6_1 = L6_1.lower
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = MpCommon
L6_1 = L6_1.ExpandEnvironmentVariables
L7_1 = "%programfiles(x86)%"
L6_1 = L6_1(L7_1)
if L6_1 == nil then
  L7_1 = ""
  if L7_1 then
    goto lbl_84
  end
end
L7_1 = L6_1
::lbl_84::
L8_1 = L7_1
L7_1 = L7_1.lower
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L8_1 = L4_1
L7_1 = L4_1.find
L9_1 = L5_1
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 == nil then
  L8_1 = L4_1
  L7_1 = L4_1.find
  L9_1 = L6_1
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 == nil then
    goto lbl_104
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_104::
L7_1 = mp
L7_1 = L7_1.get_contextdata
L8_1 = mp
L8_1 = L8_1.CONTEXT_DATA_FILENAME
L7_1 = L7_1(L8_1)
if L7_1 == nil then
  L8_1 = ""
  if L8_1 then
    goto lbl_115
  end
end
L8_1 = L7_1
::lbl_115::
L9_1 = L8_1
L8_1 = L8_1.lower
L8_1 = L8_1(L9_1)
L7_1 = L8_1
L8_1 = sysio
L8_1 = L8_1.IsFileExists
L9_1 = L4_1
L10_1 = "\\"
L11_1 = L7_1
L9_1 = L9_1 .. L10_1 .. L11_1
L8_1 = L8_1(L9_1)
if not L8_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
