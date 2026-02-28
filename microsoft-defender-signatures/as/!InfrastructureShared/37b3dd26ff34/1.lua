local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.command_line
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1.command_line
    L1_1 = L1_1(L2_1)
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "antimalware_provider.+\\frhook"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "c:\\sophrm\\invoke-blkeyescrow.ps1"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "c:\\vpc10\\applicationupdate\\sub_settings_defender.vbs"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = ":\\program files\\"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = ":\\program files (x86)\\"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_72
      end
    end
    L3_1 = L1_1
    L2_1 = L1_1.find
    L4_1 = "checkpoint"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L3_1 = L1_1
      L2_1 = L1_1.find
      L4_1 = "fortinet"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        goto lbl_72
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_72::
    L2_1 = bm_AddRelatedFileFromCommandLine
    L3_1 = L1_1
    L4_1 = nil
    L5_1 = nil
    L6_1 = 1
    L2_1(L3_1, L4_1, L5_1, L6_1)
    L2_1 = AddResearchData
    L3_1 = L0_1.ppid
    L4_1 = true
    L2_1(L3_1, L4_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
