local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.image_path
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= "w3wp.exe" and L2_1 ~= "httpd.exe" then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "tomcat"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        goto lbl_70
      end
    end
    L3_1 = mp
    L3_1 = L3_1.GetScannedPPID
    L3_1 = L3_1()
    if L3_1 == "" or L3_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.GetProcessCommandLine
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = "cd /d ([^\\s]+&[^\\s])"
    L6_1 = MpCommon
    L6_1 = L6_1.StringRegExpSearch
    L7_1 = L5_1
    L8_1 = L4_1
    L6_1, L7_1 = L6_1(L7_1, L8_1)
    if L6_1 == true then
      L8_1 = L0_1.ppid
      if L8_1 ~= "" and L8_1 ~= nil then
        L9_1 = TrackPidAndTechnique
        L10_1 = L8_1
        L11_1 = "T1505.003"
        L12_1 = "webshell_parent"
        L13_1 = 604800
        L9_1(L10_1, L11_1, L12_1, L13_1)
      end
      L9_1 = mp
      L9_1 = L9_1.INFECTED
      return L9_1
    end
  end
end
::lbl_70::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
