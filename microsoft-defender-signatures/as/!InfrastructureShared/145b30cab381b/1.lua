local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "\\([^\\]+)$"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = {}
L2_1["etrasvc.exe"] = true
L3_1 = L2_1[L1_1]
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = pcall
L4_1 = bm
L4_1 = L4_1.get_current_process_startup_info
L3_1, L4_1 = L3_1(L4_1)
if L3_1 then
  L5_1 = bm_AddRelatedFileFromCommandLine
  L6_1 = L4_1.command_line
  L7_1 = nil
  L8_1 = nil
  L9_1 = 1
  L5_1(L6_1, L7_1, L8_1, L9_1)
end
L5_1 = nil
L6_1 = nil
L7_1 = this_sigattrlog
L7_1 = L7_1[2]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[2]
  L7_1 = L7_1.utf8p2
  if L7_1 ~= nil then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L5_1 = L7_1.utf8p2
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L7_1 = L7_1.utf8p1
    L6_1 = L7_1 or L6_1
    if not L7_1 then
      L6_1 = ""
    end
end
else
  L7_1 = this_sigattrlog
  L7_1 = L7_1[3]
  L7_1 = L7_1.matched
  if L7_1 then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[3]
    L7_1 = L7_1.utf8p2
    if L7_1 ~= nil then
      L7_1 = this_sigattrlog
      L7_1 = L7_1[3]
      L5_1 = L7_1.utf8p2
      L7_1 = this_sigattrlog
      L7_1 = L7_1[3]
      L7_1 = L7_1.utf8p1
      L6_1 = L7_1 or L6_1
      if not L7_1 then
        L6_1 = ""
      end
    end
  end
end
if L5_1 ~= nil and L5_1 ~= "" then
  L7_1 = string
  L7_1 = L7_1.lower
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L6_1
  L8_1 = L8_1(L9_1)
  L10_1 = L7_1
  L9_1 = L7_1.find
  L11_1 = "amlsaap"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if not L9_1 then
    L10_1 = L8_1
    L9_1 = L8_1.find
    L11_1 = "amlsaap"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if not L9_1 then
      goto lbl_98
    end
  end
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  do return L9_1 end
  ::lbl_98::
  L10_1 = L7_1
  L9_1 = L7_1.find
  L11_1 = "wsauth$"
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L10_1 = L7_1
  L9_1 = L7_1.find
  L11_1 = "tspkg$"
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = mp
  L9_1 = L9_1.GetExecutablesFromCommandLine
  L10_1 = L5_1
  L9_1 = L9_1(L10_1)
  L10_1 = ipairs
  L11_1 = L9_1
  L10_1, L11_1, L12_1 = L10_1(L11_1)
  for L13_1, L14_1 in L10_1, L11_1, L12_1 do
    L15_1 = mp
    L15_1 = L15_1.ContextualExpandEnvironmentVariables
    L16_1 = L14_1
    L15_1 = L15_1(L16_1)
    L14_1 = L15_1
    L15_1 = sysio
    L15_1 = L15_1.IsFileExists
    L16_1 = L14_1
    L15_1 = L15_1(L16_1)
    if L15_1 then
      L15_1 = bm
      L15_1 = L15_1.add_threat_file
      L16_1 = L14_1
      L15_1(L16_1)
    end
  end
  L10_1 = TrackPidAndTechniqueBM
  L11_1 = L4_1.ppid
  L12_1 = "T1547.005"
  L13_1 = "ssp_tamper"
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
