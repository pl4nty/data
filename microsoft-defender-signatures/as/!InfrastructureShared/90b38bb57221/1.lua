local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.DisableSignature
L0_1()
L0_1 = nil
L1_1 = nil
L2_1 = isTamperProtectionOn
L2_1 = L2_1()
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L0_1 = L2_1.utf8p2
    end
  end
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "%-[eE][ncodemaNCODEMA]*%s+"
L5_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = NormalizeCmdline
  L3_1 = "powershell"
  L4_1 = L0_1
  L2_1 = L2_1(L3_1, L4_1)
  L1_1 = L2_1
end
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L1_1
L4_1 = {}
L5_1 = "add-mppreference"
L6_1 = "set-mppreference"
L4_1[1] = L5_1
L4_1[2] = L6_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L3_1 = "detect_host.exe"
L4_1 = "powerclivmware"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L3_1 = L3_1()
L4_1 = GetFileName
L5_1 = L3_1.image_path
L4_1 = L4_1(L5_1)
L5_1 = {}
L6_1 = "perl.exe"
L7_1 = "python.exe"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = contains
L7_1 = L4_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = contains
L7_1 = L1_1
L8_1 = {}
L9_1 = "add-mppreference"
L10_1 = "set-mppreference"
L8_1[1] = L9_1
L8_1[2] = L10_1
L6_1 = L6_1(L7_1, L8_1)
if L6_1 then
  L6_1 = contains
  L7_1 = L1_1
  L8_1 = {}
  L9_1 = "-disable"
  L10_1 = "-exclusion"
  L8_1[1] = L9_1
  L8_1[2] = L10_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "proc_cmdline"
    L8_1 = L1_1
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = TrackPidAndTechniqueBM
    L7_1 = "BM"
    L8_1 = "T1562.001"
    L9_1 = "mptamper_av"
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
