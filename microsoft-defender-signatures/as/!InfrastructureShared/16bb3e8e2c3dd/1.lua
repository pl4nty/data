local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.utf8p1
    L1_1 = MpCommon
    L1_1 = L1_1.PathToWin32Path
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1 or L0_1
    if not L1_1 then
    end
    if not L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "^(.*)\\"
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = bm
    L2_1 = L2_1.get_imagepath
    L2_1 = L2_1()
    if not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1 or L2_1
    if not L3_1 then
    end
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "^(.*)\\"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= L1_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.IsKnownFriendlyFile
    L5_1 = L0_1
    L6_1 = true
    L7_1 = false
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = sysio
    L4_1 = L4_1.GetPEVersionInfo
    L5_1 = L2_1
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
        goto lbl_100
      end
    end
    L5_1 = L4_1.LegalCopyright
    if L5_1 then
      L5_1 = contains
      L6_1 = L4_1.LegalCopyright
      L7_1 = "asus"
      L5_1 = L5_1(L6_1, L7_1)
      ::lbl_100::
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
        L8_1 = L2_1
        L9_1 = "|"
        L10_1 = L0_1
        L8_1 = L8_1 .. L9_1 .. L10_1
        L9_1 = bm
        L9_1 = L9_1.RelatedStringBMReport
        L6_1(L7_1, L8_1, L9_1)
        L6_1 = bm
        L6_1 = L6_1.add_related_file
        L7_1 = L2_1
        L6_1(L7_1)
        L6_1 = bm
        L6_1 = L6_1.add_related_file
        L7_1 = L0_1
        L6_1(L7_1)
        L6_1 = IsFileRecentlyDropped
        L7_1 = L0_1
        L6_1, L7_1, L8_1 = L6_1(L7_1)
        if L6_1 then
          L9_1 = bm
          L9_1 = L9_1.add_related_string
          L10_1 = "RecentDrop"
          L11_1 = L7_1
          L12_1 = "|"
          L13_1 = safeJsonDeserialize
          L14_1 = L8_1
          L13_1 = L13_1(L14_1)
          if not L13_1 then
            L13_1 = ""
          end
          L11_1 = L11_1 .. L12_1 .. L13_1
          L12_1 = bm
          L12_1 = L12_1.RelatedStringBMReport
          L9_1(L10_1, L11_1, L12_1)
        end
        L9_1 = sysio
        L9_1 = L9_1.GetPEVersionInfo
        L10_1 = L0_1
        L9_1 = L9_1(L10_1)
        if not L9_1 then
          L9_1 = {}
        end
        L10_1 = bm
        L10_1 = L10_1.add_related_string
        L11_1 = "version_info_dll"
        L12_1 = L9_1
        L13_1 = bm
        L13_1 = L13_1.RelatedStringBMReport
        L10_1(L11_1, L12_1, L13_1)
        L10_1 = mp
        L10_1 = L10_1.INFECTED
        return L10_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
