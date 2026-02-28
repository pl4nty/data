local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "MpCmdLineFoundB64"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    goto lbl_21
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_21::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.image_path
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "\\explorer.exe"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L4_1 = L3_1
L3_1 = L3_1.lower
L3_1 = L3_1(L4_1)
L4_1 = NormalizeCmdline
L5_1 = "powershell"
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = isIEXfound
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = "downloadstring[\\'\\\"\\(\\s]+https?:\\/\\/\\d+.\\d+.\\d+.\\d+\\/\\w+[\\'\\\"\\)\\s]+"
L6_1 = MpCommon
L6_1 = L6_1.StringRegExpSearch
L7_1 = L5_1
L8_1 = L4_1
L6_1, L7_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
