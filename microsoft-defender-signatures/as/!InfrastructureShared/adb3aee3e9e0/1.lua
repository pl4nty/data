local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p2
    L3_1 = L2_1
    L2_1 = L2_1.lower
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      L3_1 = L2_1
      L2_1 = L2_1.lower
      L2_1 = L2_1(L3_1)
      L0_1 = L2_1
    end
  end
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = {}
L5_1 = ".dll"
L6_1 = ".ocx"
L7_1 = ".cpl"
L8_1 = ".xla"
L9_1 = ".xlam"
L10_1 = ".xll"
L11_1 = ".vsto"
L12_1 = ".olb"
L13_1 = "--no-sandbox"
L14_1 = "zebra_default.dat"
L15_1 = "program files"
L16_1 = "sogoutsf.ime"
L17_1 = ".ax"
L18_1 = ".wll"
L19_1 = "setupinfobjectinstallaction"
L20_1 = "openas_rundll"
L21_1 = ".pdf"
L22_1 = "shellexec_rundll"
L23_1 = "\\windows\\installer\\"
L24_1 = ".wcx"
L25_1 = ".wsc"
L26_1 = ".exe"
L27_1 = "printui"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L4_1[15] = L19_1
L4_1[16] = L20_1
L4_1[17] = L21_1
L4_1[18] = L22_1
L4_1[19] = L23_1
L4_1[20] = L24_1
L4_1[21] = L25_1
L4_1[22] = L26_1
L4_1[23] = L27_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 ~= nil then
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "proc_cmdline"
  L4_1 = L0_1
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = extractDllForRegproc
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.ContextualExpandEnvironmentVariables
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = sysio
    L2_1 = L2_1.GetFileLastWriteTime
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L3_1 = sysio
    L3_1 = L3_1.GetLastResult
    L3_1 = L3_1()
    L3_1 = L3_1.Success
    if L3_1 and L2_1 ~= 0 then
      L3_1 = L2_1 / 10000000
      L2_1 = L3_1 - 11644473600
      L3_1 = MpCommon
      L3_1 = L3_1.GetCurrentTimeT
      L3_1 = L3_1()
      if not (L2_1 > L3_1) then
        L4_1 = L3_1 - L2_1
        if not (3600 < L4_1) then
          goto lbl_136
        end
      end
      L4_1 = bm
      L4_1 = L4_1.add_related_file
      L5_1 = L1_1
      L4_1(L5_1)
      L4_1 = mp
      L4_1 = L4_1.IsKnownFriendlyFile
      L5_1 = L1_1
      L6_1 = true
      L7_1 = false
      L4_1 = L4_1(L5_1, L6_1, L7_1)
      if L4_1 == false then
        L4_1 = bm
        L4_1 = L4_1.add_threat_file
        L5_1 = L1_1
        L4_1(L5_1)
      end
    end
  end
end
::lbl_136::
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
