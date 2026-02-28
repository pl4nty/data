local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = this_sigattrlog
L0_1 = L0_1[7]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[7]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    goto lbl_14
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_14::
L0_1 = string
L0_1 = L0_1.lower
L1_1 = this_sigattrlog
L1_1 = L1_1[7]
L1_1 = L1_1.utf8p2
L0_1 = L0_1(L1_1)
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if 4 < L2_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L4_1 = L1_1
    L3_1 = L1_1.match
    L5_1 = "\\([^\\]+)$"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = ""
    end
    L2_1 = L2_1(L3_1)
    L3_1 = {}
    L3_1["services.exe"] = true
    L3_1["svchost.exe"] = true
    L3_1["trustedinstaller.exe"] = true
    L3_1["tiworker.exe"] = true
    L3_1["poqexec.exe"] = true
    L3_1["msmpeng.exe"] = true
    L3_1["msiexec.exe"] = true
    L3_1["setuphost.exe"] = true
    L3_1["osrssinst.exe"] = true
    L3_1["printisolationhost.exe"] = true
    L4_1 = L3_1[L2_1]
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = isnull
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L0_1 = L3_1
end
L3_1 = mp
L3_1 = L3_1.GetExecutablesFromCommandLine
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L4_1 = nil
L5_1 = isnull
L6_1 = L3_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L4_1 = L3_1[1]
else
  L4_1 = L0_1
end
L5_1 = {}
L6_1 = "\\spool\\drivers\\"
L7_1 = "\\printconfig.dll"
L8_1 = "\\hpzipm12.dll"
L9_1 = "\\windows\\system32\\spool\\"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L5_1[4] = L9_1
L6_1 = ipairs
L7_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = string
  L11_1 = L11_1.find
  L12_1 = L4_1
  L13_1 = L10_1
  L14_1 = 1
  L15_1 = true
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
  if L11_1 then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
end
L6_1 = mp
L6_1 = L6_1.IsKnownFriendlyFile
L7_1 = L4_1
L8_1 = true
L9_1 = false
L6_1 = L6_1(L7_1, L8_1, L9_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = this_sigattrlog
L6_1 = L6_1[7]
L6_1 = L6_1.utf8p1
L7_1 = isnull
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L6_1
  L8_1 = L8_1(L9_1)
  L9_1 = "\\services\\([^\\]+)"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L8_1 = bm
    L8_1 = L8_1.add_related_string
    L9_1 = "HijackedService"
    L10_1 = L7_1
    L11_1 = bm
    L11_1 = L11_1.RelatedStringBMReport
    L8_1(L9_1, L10_1, L11_1)
  end
end
L7_1 = sysio
L7_1 = L7_1.IsFileExists
L8_1 = L4_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = bm
  L7_1 = L7_1.add_related_file
  L8_1 = L4_1
  L7_1(L8_1)
  L7_1 = bm
  L7_1 = L7_1.add_threat_file
  L8_1 = L4_1
  L7_1(L8_1)
end
L7_1 = TrackFileAndTechnique
L8_1 = L4_1
L9_1 = "T1543.003:svc_dll_hijack"
L10_1 = 1000
L7_1(L8_1, L9_1, L10_1)
L7_1 = TrackPidAndTechniqueBM
L8_1 = "BM"
L9_1 = "T1574.001"
L10_1 = "susp_svc_dll_hijack"
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
