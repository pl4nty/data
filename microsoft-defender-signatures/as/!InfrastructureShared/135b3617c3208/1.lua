local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "\\([^\\]+)$"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = {}
L2_1["svchost.exe"] = true
L2_1["lsass.exe"] = true
L2_1["services.exe"] = true
L2_1["connectionclient.exe"] = true
L3_1 = L2_1[L1_1]
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L3_1 = L4_1.utf8p2
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L3_1 = L4_1.utf8p2
    end
  end
end
if L3_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L6_1 = L4_1
  L5_1 = L4_1.find
  L7_1 = "wsauth$"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L6_1 = L4_1
  L5_1 = L4_1.find
  L7_1 = "amlsaap"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L6_1 = L4_1
  L5_1 = L4_1.find
  L7_1 = "tspkg$"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.GetExecutablesFromCommandLine
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  L6_1 = ipairs
  L7_1 = L5_1
  L6_1, L7_1, L8_1 = L6_1(L7_1)
  for L9_1, L10_1 in L6_1, L7_1, L8_1 do
    L11_1 = mp
    L11_1 = L11_1.ContextualExpandEnvironmentVariables
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    L10_1 = L11_1
    L11_1 = sysio
    L11_1 = L11_1.IsFileExists
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L11_1 = bm
      L11_1 = L11_1.add_related_file
      L12_1 = L10_1
      L11_1(L12_1)
    end
  end
end
L4_1 = pcall
L5_1 = bm
L5_1 = L5_1.get_current_process_startup_info
L4_1, L5_1 = L4_1(L5_1)
if L4_1 then
  L6_1 = bm_AddRelatedFileFromCommandLine
  L7_1 = L5_1.command_line
  L8_1 = nil
  L9_1 = nil
  L10_1 = 1
  L6_1(L7_1, L8_1, L9_1, L10_1)
end
L6_1 = TrackPidAndTechniqueBM
L7_1 = L5_1.ppid
L8_1 = "T1547.005"
L9_1 = "ssp_tamper"
L6_1(L7_1, L8_1, L9_1)
L6_1 = AddTacticForPid
L7_1 = L5_1.ppid
L8_1 = "tt-thresholdmet"
L6_1(L7_1, L8_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
