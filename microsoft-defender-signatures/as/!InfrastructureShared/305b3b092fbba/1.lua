local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L2_1 = this_sigattrlog
L2_1 = L2_1[12]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[12]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[12]
    L0_1 = L2_1.utf8p2
    L2_1 = this_sigattrlog
    L2_1 = L2_1[12]
    L1_1 = L2_1.utf8p1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[13]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[13]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[13]
      L0_1 = L2_1.utf8p2
      L2_1 = this_sigattrlog
      L2_1 = L2_1[13]
      L1_1 = L2_1.utf8p1
  end
  else
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
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
L5_1 = mp
L5_1 = L5_1.IsKnownFriendlyFile
L6_1 = L4_1
L7_1 = true
L8_1 = false
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = isnull
L6_1 = L1_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.match
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L1_1
  L6_1 = L6_1(L7_1)
  L7_1 = "\\services\\([^\\]+)"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "HijackedService"
    L8_1 = L5_1
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
  end
end
L5_1 = sysio
L5_1 = L5_1.IsFileExists
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = bm
  L5_1 = L5_1.add_related_file
  L6_1 = L4_1
  L5_1(L6_1)
  L5_1 = bm
  L5_1 = L5_1.add_threat_file
  L6_1 = L4_1
  L5_1(L6_1)
end
L5_1 = bm
L5_1 = L5_1.get_imagepath
L5_1 = L5_1()
L6_1 = isnull
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if not L6_1 then
  L6_1 = bm
  L6_1 = L6_1.add_related_string
  L7_1 = "AttackerTool"
  L8_1 = L5_1
  L9_1 = bm
  L9_1 = L9_1.RelatedStringBMReport
  L6_1(L7_1, L8_1, L9_1)
end
L6_1 = TrackFileAndTechnique
L7_1 = L4_1
L8_1 = "T1543.003:svc_hijack_script_chain"
L9_1 = 1000
L6_1(L7_1, L8_1, L9_1)
L6_1 = TrackPidAndTechniqueBM
L7_1 = "BM"
L8_1 = "T1574.001"
L9_1 = "susp_svc_dll_hijack_script"
L6_1(L7_1, L8_1, L9_1)
L6_1 = TrackPidAndTechniqueBM
L7_1 = "BM"
L8_1 = "T1543.003"
L9_1 = "susp_svc_dll_hijack_script"
L6_1(L7_1, L8_1, L9_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
