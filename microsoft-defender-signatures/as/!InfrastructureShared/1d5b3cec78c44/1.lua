local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.ExpandEnvironmentVariables
L3_1 = "%WINDIR%\\SYSTEM32\\"
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L3_1 = L0_1
L2_1 = L0_1.find
L4_1 = L1_1
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1["srdelayed.exe"] = true
L2_1["poqexec.exe"] = true
L2_1["setupcl.exe"] = true
L2_1["register-cimprovider2.exe"] = true
L2_1["msiexec.exe"] = true
L3_1 = MpCommon
L3_1 = L3_1.GetOriginalFileName
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 ~= "" and L3_1 ~= nil then
  L4_1 = bm
  L4_1 = L4_1.add_related_string
  L5_1 = "OriginalFileName"
  L6_1 = L3_1
  L7_1 = bm
  L7_1 = L7_1.RelatedStringBMReport
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = L2_1[L3_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.IsKnownFriendlyFile
L5_1 = L0_1
L6_1 = true
L7_1 = false
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 == false then
  L4_1 = bm
  L4_1 = L4_1.add_related_string
  L5_1 = "FriendlyFile"
  L6_1 = "false"
  L7_1 = bm
  L7_1 = L7_1.RelatedStringBMReport
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = MpCommon
L4_1 = L4_1.GetOriginalFileName
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L5_1 = sysio
  L5_1 = L5_1.GetPEVersionInfo
  L6_1 = L0_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L6_1 = L5_1.OriginalFilename
    if L6_1 then
      L6_1 = L5_1.OriginalFilename
      if L6_1 ~= "" then
        goto lbl_107
      end
    end
  end
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "OriginalFileName_PeParser"
  L8_1 = "null"
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  do return L6_1 end
  ::lbl_107::
  L4_1 = L5_1.OriginalFilenam
end
L5_1 = MpCommon
L5_1 = L5_1.SetOriginalFileName
L6_1 = L0_1
L7_1 = L4_1
L5_1(L6_1, L7_1)
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "OriginalFileName_PeParser"
L7_1 = L4_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L5_1 = L2_1[L5_1]
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
