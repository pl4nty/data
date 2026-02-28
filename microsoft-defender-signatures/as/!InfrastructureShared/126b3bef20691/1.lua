local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L0_1 = L1_1.utf8p1
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.IsKnownFriendlyFile
L2_1 = L0_1
L3_1 = true
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.utf8p1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L1_1 = L2_1.utf8p1
  end
end
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "^(.*)\\"
L2_1 = L2_1(L3_1, L4_1)
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "^(.*)\\"
L3_1 = L3_1(L4_1, L5_1)
if L2_1 ~= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = sysio
L4_1 = L4_1.GetPEVersionInfo
L5_1 = L1_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = {}
end
L5_1 = L4_1.OriginalFilename
if L5_1 then
  L5_1 = contains
  L6_1 = L4_1.OriginalFilename
  L7_1 = {}
  L8_1 = "U3BoostSvr"
  L9_1 = "AgentInstall"
  L10_1 = "USHSVC"
  L7_1[1] = L8_1
  L7_1[2] = L9_1
  L7_1[3] = L10_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    goto lbl_102
  end
end
L5_1 = L4_1.LegalCopyright
if L5_1 then
  L5_1 = contains
  L6_1 = L4_1.LegalCopyright
  L7_1 = "asus"
  L5_1 = L5_1(L6_1, L7_1)
  ::lbl_102::
  if L5_1 then
    L5_1 = L4_1.OriginalFilename
    if not L5_1 then
      L5_1 = ""
    end
    L6_1 = "|"
    L7_1 = L4_1.CompanyName
    if not L7_1 then
      L7_1 = ""
    end
    L8_1 = "|"
    L9_1 = L4_1.LegalCopyright
    if not L9_1 then
      L9_1 = ""
    end
    L5_1 = L5_1 .. L6_1 .. L7_1 .. L8_1 .. L9_1
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "version_info"
    L8_1 = L5_1
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "BinaryPaths"
    L8_1 = L1_1
    L9_1 = "|"
    L10_1 = L0_1
    L8_1 = L8_1 .. L9_1 .. L10_1
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = bm
    L6_1 = L6_1.add_related_file
    L7_1 = L1_1
    L6_1(L7_1)
    L6_1 = bm
    L6_1 = L6_1.add_threat_file
    L7_1 = L0_1
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
