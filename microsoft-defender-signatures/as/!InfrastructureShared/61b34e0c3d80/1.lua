local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.sub
  L3_1 = 1
  L4_1 = 2
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  if L1_1 ~= "\\\\" then
    L2_1 = L0_1
    L1_1 = L0_1.sub
    L3_1 = 1
    L4_1 = 3
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 ~= "\"\\\\" then
      L2_1 = L0_1
      L1_1 = L0_1.sub
      L3_1 = 1
      L4_1 = 3
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 ~= "'\\\\" then
        goto lbl_109
      end
    end
  end
  L1_1 = IsPidExcluded
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.ppid
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "\\sysvol"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "\\netlogon"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = "\\ccm"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L2_1 = L0_1
        L1_1 = L0_1.find
        L3_1 = "\\sccm"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          goto lbl_79
        end
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  do return L1_1 end
  ::lbl_79::
  L1_1 = bm
  L1_1 = L1_1.get_current_process_startup_info
  L1_1 = L1_1()
  if L1_1 ~= nil then
    L2_1 = L1_1.command_line
    if L2_1 ~= nil then
      L2_1 = L1_1.image_path
      if L2_1 ~= nil then
        goto lbl_93
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  do return L2_1 end
  ::lbl_93::
  L2_1 = IsHostAttackServerCloudChk
  L3_1 = L0_1
  L4_1 = "Behavior:Win32/SuspExecFromRemoteShare.C"
  L5_1 = L1_1.image_path
  L6_1 = L1_1.command_line
  L7_1 = "ExecFromSmbShare"
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
  if L2_1 then
    L2_1 = AddResearchData
    L3_1 = "BM"
    L4_1 = true
    L2_1(L3_1, L4_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
::lbl_109::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
