local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[27]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[27]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[27]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[28]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[28]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[28]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 then
  L1_1 = bm
  L1_1 = L1_1.get_imagepath
  L1_1 = L1_1()
  if L1_1 ~= nil then
    L3_1 = L1_1
    L2_1 = L1_1.len
    L2_1 = L2_1(L3_1)
    if 11 < L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.sub
      L4_1 = -12
      L2_1 = L2_1(L3_1, L4_1)
      L3_1 = L2_1
      L2_1 = L2_1.lower
      L2_1 = L2_1(L3_1)
      if L2_1 == "\\svchost.exe" then
        L3_1 = bm
        L3_1 = L3_1.get_current_process_startup_info
        L3_1 = L3_1()
        if L3_1 ~= nil then
          L4_1 = L3_1.command_line
          if L4_1 ~= nil then
            L4_1 = string
            L4_1 = L4_1.lower
            L5_1 = L3_1.command_line
            L4_1 = L4_1(L5_1)
            L6_1 = L4_1
            L5_1 = L4_1.find
            L7_1 = "gpsvc"
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if L5_1 then
              L5_1 = mp
              L5_1 = L5_1.CLEAN
              return L5_1
            end
          end
        end
      end
    end
  end
  L3_1 = L0_1
  L2_1 = L0_1.find
  L4_1 = "windowspowershell\\v1.0\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    L3_1 = L0_1
    L2_1 = L0_1.find
    L4_1 = "documents\\powershell\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      goto lbl_104
    end
  end
  L2_1 = bm_AddRelatedFileFromCommandLine
  L3_1 = L0_1
  L4_1 = nil
  L5_1 = nil
  L6_1 = 1
  L2_1(L3_1, L4_1, L5_1, L6_1)
  L2_1 = TrackPidAndTechniqueBM
  L3_1 = this_sigattrlog
  L3_1 = L3_1[27]
  L3_1 = L3_1.ppid
  L4_1 = "T1546.013"
  L5_1 = "posh_profile_modify"
  L2_1(L3_1, L4_1, L5_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_104::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
