local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[6]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[7]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[8]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[9]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[10]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[10]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[11]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[11]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[12]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[12]
  L0_1 = L1_1.utf8p2
end
L1_1 = this_sigattrlog
L1_1 = L1_1[13]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[13]
  L0_1 = L1_1.utf8p2
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
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
L2_1 = true
L3_1 = mp
L3_1 = L3_1.IsKnownFriendlyFile
L4_1 = L0_1
L5_1 = true
L6_1 = false
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == false then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "FriendlyFile"
  L5_1 = "false"
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L2_1 = false
end
L3_1 = MpCommon
L3_1 = L3_1.GetOriginalFileName
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = sysio
  L4_1 = L4_1.GetPEVersionInfo
  L5_1 = L0_1
  L4_1 = L4_1(L5_1)
  if not L2_1 then
    if L4_1 then
      L5_1 = L4_1.OriginalFilename
      if L5_1 then
        L5_1 = L4_1.OriginalFilename
        if L5_1 ~= "" then
          goto lbl_151
        end
      end
    end
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "OriginalFileName_PeParser"
    L7_1 = "null"
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = bm
    L5_1 = L5_1.add_threat_file
    L6_1 = L0_1
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
  ::lbl_151::
  L3_1 = L4_1.OriginalFilename
  L5_1 = MpCommon
  L5_1 = L5_1.SetOriginalFileName
  L6_1 = L0_1
  L7_1 = L3_1
  L5_1(L6_1, L7_1)
end
L5_1 = L0_1
L4_1 = L0_1.match
L6_1 = "(%w+%.exe)$"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L3_1 = L5_1
if L3_1 == L4_1 and L2_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L2_1 and L3_1 == "register-cimprovider2.exe" and L4_1 == "register-cimprovider.exe" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = bm
L5_1 = L5_1.add_threat_file
L6_1 = L0_1
L5_1(L6_1)
L5_1 = bm
L5_1 = L5_1.add_related_string
L6_1 = "OriginalFileName_PeParser"
L7_1 = L0_1
L8_1 = "|"
L9_1 = L3_1
L7_1 = L7_1 .. L8_1 .. L9_1
L8_1 = bm
L8_1 = L8_1.RelatedStringBMReport
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
