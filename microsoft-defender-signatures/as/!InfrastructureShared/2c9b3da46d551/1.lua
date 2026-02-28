local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L0_1 = L2_1.utf8p2
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L1_1 = L2_1.utf8p1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L0_1 = L2_1.utf8p2
      L2_1 = this_sigattrlog
      L2_1 = L2_1[8]
      L1_1 = L2_1.utf8p1
  end
  else
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if not L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.matched
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.ContextualExpandEnvironmentVariables
L4_1 = L0_1
L3_1 = L3_1(L4_1)
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L0_1 = L4_1
end
L4_1 = mp
L4_1 = L4_1.GetExecutablesFromCommandLine
L5_1 = L0_1
L4_1 = L4_1(L5_1)
L5_1 = nil
L6_1 = isnull
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if not L6_1 then
  L5_1 = L4_1[1]
else
  L5_1 = L0_1
end
L6_1 = nil
L7_1 = this_sigattrlog
L7_1 = L7_1[9]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[9]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = this_sigattrlog
    L8_1 = L8_1[9]
    L8_1 = L8_1.utf8p1
    L7_1 = L7_1(L8_1)
    L6_1 = L7_1
end
else
  L7_1 = this_sigattrlog
  L7_1 = L7_1[10]
  L7_1 = L7_1.matched
  if L7_1 then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[10]
    L7_1 = L7_1.utf8p1
    if L7_1 ~= nil then
      L7_1 = string
      L7_1 = L7_1.lower
      L8_1 = this_sigattrlog
      L8_1 = L8_1[10]
      L8_1 = L8_1.utf8p1
      L7_1 = L7_1(L8_1)
      L6_1 = L7_1
    end
  end
end
L7_1 = string
L7_1 = L7_1.match
L8_1 = L5_1
L9_1 = "\\([^\\]+)$"
L7_1 = L7_1(L8_1, L9_1)
L8_1 = false
if L7_1 ~= nil and L6_1 ~= nil then
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L6_1
  L11_1 = L7_1
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 then
    L8_1 = true
    L9_1 = bm
    L9_1 = L9_1.add_related_string
    L10_1 = "CorrelatedExclusion"
    L11_1 = "AV_exclusion_matches_svc_binary"
    L12_1 = bm
    L12_1 = L12_1.RelatedStringBMReport
    L9_1(L10_1, L11_1, L12_1)
  end
end
if not L8_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.IsKnownFriendlyFile
L10_1 = L5_1
L11_1 = true
L12_1 = false
L9_1 = L9_1(L10_1, L11_1, L12_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L1_1 ~= nil then
  L9_1 = string
  L9_1 = L9_1.match
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L1_1
  L10_1 = L10_1(L11_1)
  L11_1 = "\\services\\([^\\]+)"
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L10_1 = bm
    L10_1 = L10_1.add_related_string
    L11_1 = "HijackedService"
    L12_1 = L9_1
    L13_1 = bm
    L13_1 = L13_1.RelatedStringBMReport
    L10_1(L11_1, L12_1, L13_1)
  end
end
L9_1 = sysio
L9_1 = L9_1.IsFileExists
L10_1 = L5_1
L9_1 = L9_1(L10_1)
if L9_1 then
  L9_1 = bm
  L9_1 = L9_1.add_related_file
  L10_1 = L5_1
  L9_1(L10_1)
  L9_1 = bm
  L9_1 = L9_1.add_threat_file
  L10_1 = L5_1
  L9_1(L10_1)
end
L9_1 = TrackFileAndTechnique
L10_1 = L5_1
L11_1 = "T1543.003:svc_hijack_with_av_excl"
L12_1 = 1000
L9_1(L10_1, L11_1, L12_1)
L9_1 = TrackPidAndTechniqueBM
L10_1 = "BM"
L11_1 = "T1574.001"
L12_1 = "susp_svc_dll_hijack_excl"
L9_1(L10_1, L11_1, L12_1)
L9_1 = TrackPidAndTechniqueBM
L10_1 = "BM"
L11_1 = "T1562.001"
L12_1 = "av_tamper_svc_hijack"
L9_1(L10_1, L11_1, L12_1)
L9_1 = TrackPidAndTechniqueBM
L10_1 = "BM"
L11_1 = "T1543.003"
L12_1 = "susp_svc_dll_hijack_excl"
L9_1(L10_1, L11_1, L12_1)
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
