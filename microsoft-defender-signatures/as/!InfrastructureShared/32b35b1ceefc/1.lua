local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = bm
    L0_1 = L0_1.add_related_string
    L1_1 = "Evidence"
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L3_1 = bm
    L3_1 = L3_1.RelatedStringBMReport
    L0_1(L1_1, L2_1, L3_1)
    L0_1 = safeJsonDeserialize
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L1_1 = L1_1.utf8p2
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = {}
    L2_1 = "onedrivestandaloneupdater.exe"
    L3_1 = "OneDrive.exe"
    L4_1 = "gup.exe"
    L5_1 = "WinHex.exe"
    L6_1 = "EBWebView.exe"
    L1_1[1] = L2_1
    L1_1[2] = L3_1
    L1_1[3] = L4_1
    L1_1[4] = L5_1
    L1_1[5] = L6_1
    L2_1 = contains
    L3_1 = L0_1.AppName
    L4_1 = L1_1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = L0_1.Dll_Path
      if L2_1 then
        L2_1 = bm
        L2_1 = L2_1.add_threat_file
        L3_1 = L0_1.Dll_Path
        L2_1(L3_1)
      end
      L2_1 = pcall
      L3_1 = reportBmInfo
      L2_1, L3_1 = L2_1(L3_1)
      if not L2_1 and L3_1 then
        L4_1 = bm
        L4_1 = L4_1.add_related_string
        L5_1 = "bmInfoFailReason"
        L6_1 = tostring
        L7_1 = L3_1
        L6_1 = L6_1(L7_1)
        L7_1 = bm
        L7_1 = L7_1.RelatedStringBMReport
        L4_1(L5_1, L6_1, L7_1)
      end
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
    L2_1 = bm
    L2_1 = L2_1.get_imagepath
    L2_1 = L2_1()
    if not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = MpCommon
    L3_1 = L3_1.GetOriginalFileName
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L4_1 = sysio
      L4_1 = L4_1.GetPEVersionInfo
      L5_1 = L2_1
      L4_1 = L4_1(L5_1)
      if L4_1 then
        L5_1 = L4_1.OriginalFilename
        if L5_1 then
          L5_1 = L4_1.OriginalFilename
          L6_1 = tostring
          L7_1 = L4_1.FileDescription
          L6_1 = L6_1(L7_1)
          L3_1 = L5_1 .. L6_1
        end
      end
    end
    L4_1 = {}
    L5_1 = "update.exetrend"
    L6_1 = "vpnserver.*softether"
    L4_1[1] = L5_1
    L4_1[2] = L6_1
    if L3_1 then
      L5_1 = contains
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = L3_1
      L6_1 = L6_1(L7_1)
      L7_1 = L4_1
      L8_1 = false
      L5_1 = L5_1(L6_1, L7_1, L8_1)
      if L5_1 then
        L5_1 = L0_1.Dll_Path
        if L5_1 then
          L5_1 = bm
          L5_1 = L5_1.add_threat_file
          L6_1 = L0_1.Dll_Path
          L5_1(L6_1)
        end
        L5_1 = pcall
        L6_1 = reportBmInfo
        L5_1, L6_1 = L5_1(L6_1)
        if not L5_1 and L6_1 then
          L7_1 = bm
          L7_1 = L7_1.add_related_string
          L8_1 = "bmInfoFailReason"
          L9_1 = tostring
          L10_1 = L6_1
          L9_1 = L9_1(L10_1)
          L10_1 = bm
          L10_1 = L10_1.RelatedStringBMReport
          L7_1(L8_1, L9_1, L10_1)
        end
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
