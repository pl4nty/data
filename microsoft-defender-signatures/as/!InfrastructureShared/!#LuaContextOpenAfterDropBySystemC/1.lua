local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.ENGINEBUILD
if 19850 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Lua:RemoteContextPresent"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:RemoteCopyExclusions"
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.sub
L3_1 = 1
L4_1 = 8
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 == "\\device\\" then
  L1_1 = MpCommon
  L1_1 = L1_1.PathToWin32Path
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "Lua:Context/OpenAfterDropBySysproc!"
L4_1 = L1_1
L3_1 = L3_1 .. L4_1
L2_1(L3_1)
L2_1 = "cscript.exe|wscript.exe|mshta.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|svchost.exe|wsmprovhost.exe|"
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = L1_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/SuspOpenAfterDropBySysproc!lolbin"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:Context/SuspOpenAfterDropBySysproc!"
  L5_1 = L1_1
  L4_1 = L4_1 .. L5_1
  L3_1(L4_1)
  L3_1 = TrackPidAndTechnique
  L4_1 = "RTP"
  L5_1 = "T1570"
  L6_1 = "exec_remotedroppedscript_a"
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = MpCommon
L3_1 = L3_1.GetPersistContext
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = mp
L5_1 = L5_1.get_mpattribute
L6_1 = "BM_MZ_FILE"
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = {}
  L5_1.ExeFileDropBySystemProc_sysdir = "Lua:Context/OpenExeAfterDropBySystem!sysdir"
  L5_1.ExeFileDropBySystemProc_windir = "Lua:Context/OpenExeAfterDropBySystem!windir"
  L5_1.ExeFileDropBySystemProc_wintemp = "Lua:Context/OpenExeAfterDropBySystem!wintemp"
  L5_1.ExeFileDropBySystemProc_startup = "Lua:Context/OpenExeAfterDropBySystem!startup"
  L5_1.ExeFileDropBySystemProc_desktop = "Lua:Context/OpenExeAfterDropBySystem!desktop"
  L5_1.ExeFileDropBySystemProc_appdatalocal = "Lua:Context/OpenExeAfterDropBySystem!appdatalocal"
  L5_1.ExeFileDropBySystemProc_usrtemp = "Lua:Context/OpenExeAfterDropBySystem!usrtemp"
  L5_1.ExeFileDropBySystemProc_sysprof = "Lua:Context/OpenExeAfterDropBySystem!sysprof"
  L5_1.ExeFileDropBySystemProc_sysappdata = "Lua:Context/OpenExeAfterDropBySystem!sysappdata"
  L5_1.ExeFileDropBySystemProc_usrprofpub = "Lua:Context/OpenExeAfterDropBySystem!usrprofpub"
  L5_1.ExeFileDropBySystemProc_usrprofdef = "Lua:Context/OpenExeAfterDropBySystem!usrprofdef"
  L5_1.ExeFileDropBySystemProc_perflog = "Lua:Context/OpenExeAfterDropBySystem!perflog"
  L5_1.ExeFileDropBySystemProc_spool = "Lua:Context/OpenExeAfterDropBySystem!spool"
  L5_1.ExeFileDropBySystemProc_c_root = "Lua:Context/OpenExeAfterDropBySystem!c_root"
  L5_1.ExeFileDropBySystemProc_d_root = "Lua:Context/OpenExeAfterDropBySystem!d_root"
  L5_1.ExeFileDropBySystemProc_e_root = "Lua:Context/OpenExeAfterDropBySystem!e_root"
  L5_1.ExeFileDropBySystemProc_f_root = "Lua:Context/OpenExeAfterDropBySystem!f_root"
  L5_1.ExeFileDropBySystemProc_g_root = "Lua:Context/OpenExeAfterDropBySystem!g_root"
  L5_1.ExeFileDropBySystemProc_h_root = "Lua:Context/OpenExeAfterDropBySystem!h_root"
  L5_1.ExeFileDropBySystemProc_i_root = "Lua:Context/OpenExeAfterDropBySystem!i_root"
  L5_1.ExeFileDropBySystemProc_j_root = "Lua:Context/OpenExeAfterDropBySystem!j_root"
  L5_1.ExeFileDropBySystemProc_k_root = "Lua:Context/OpenExeAfterDropBySystem!k_root"
  L5_1.ExeFileDropBySystemProc_l_root = "Lua:Context/OpenExeAfterDropBySystem!l_root"
  L5_1.ExeFileDropBySystemProc_m_root = "Lua:Context/OpenExeAfterDropBySystem!m_root"
  L5_1.ExeFileDropBySystemProc_n_root = "Lua:Context/OpenExeAfterDropBySystem!n_root"
  L5_1.ExeFileDropBySystemProc_o_root = "Lua:Context/OpenExeAfterDropBySystem!o_root"
  L5_1.ExeFileDropBySystemProc_p_root = "Lua:Context/OpenExeAfterDropBySystem!p_root"
  L5_1.ExeFileDropBySystemProc_q_root = "Lua:Context/OpenExeAfterDropBySystem!q_root"
  L5_1.ExeFileDropBySystemProc_r_root = "Lua:Context/OpenExeAfterDropBySystem!r_root"
  L5_1.ExeFileDropBySystemProc_s_root = "Lua:Context/OpenExeAfterDropBySystem!s_root"
  L5_1.ExeFileDropBySystemProc_t_root = "Lua:Context/OpenExeAfterDropBySystem!t_root"
  L5_1.ExeFileDropBySystemProc_u_root = "Lua:Context/OpenExeAfterDropBySystem!u_root"
  L5_1.ExeFileDropBySystemProc_v_root = "Lua:Context/OpenExeAfterDropBySystem!v_root"
  L5_1.ExeFileDropBySystemProc_w_root = "Lua:Context/OpenExeAfterDropBySystem!w_root"
  L5_1.ExeFileDropBySystemProc_x_root = "Lua:Context/OpenExeAfterDropBySystem!x_root"
  L5_1.ExeFileDropBySystemProc_y_root = "Lua:Context/OpenExeAfterDropBySystem!y_root"
  L5_1.ExeFileDropBySystemProc_z_root = "Lua:Context/OpenExeAfterDropBySystem!z_root"
  L4_1 = L5_1
else
  L5_1 = {}
  L5_1.FileDropBySystemProc_sysdir = "Lua:Context/OpenAfterDropBySystem!sysdir"
  L5_1.FileDropBySystemProc_windir = "Lua:Context/OpenAfterDropBySystem!windir"
  L5_1.FileDropBySystemProc_wintemp = "Lua:Context/OpenAfterDropBySystem!wintemp"
  L5_1.FileDropBySystemProc_startup = "Lua:Context/OpenAfterDropBySystem!startup"
  L5_1.FileDropBySystemProc_desktop = "Lua:Context/OpenAfterDropBySystem!desktop"
  L5_1.FileDropBySystemProc_appdatalocal = "Lua:Context/OpenAfterDropBySystem!appdatalocal"
  L5_1.FileDropBySystemProc_usrtemp = "Lua:Context/OpenAfterDropBySystem!usrtemp"
  L5_1.FileDropBySystemProc_sysprof = "Lua:Context/OpenAfterDropBySystem!sysprof"
  L5_1.FileDropBySystemProc_sysappdata = "Lua:Context/OpenAfterDropBySystem!sysappdata"
  L5_1.FileDropBySystemProc_usrprofpub = "Lua:Context/OpenAfterDropBySystem!usrprofpub"
  L5_1.FileDropBySystemProc_usrprofdef = "Lua:Context/OpenAfterDropBySystem!usrprofdef"
  L5_1.FileDropBySystemProc_perflog = "Lua:Context/OpenAfterDropBySystem!perflog"
  L5_1.FileDropBySystemProc_spool = "Lua:Context/OpenAfterDropBySystem!spool"
  L5_1.FileDropBySystemProc_c_root = "Lua:Context/OpenAfterDropBySystem!c_root"
  L5_1.FileDropBySystemProc_d_root = "Lua:Context/OpenAfterDropBySystem!d_root"
  L5_1.FileDropBySystemProc_e_root = "Lua:Context/OpenAfterDropBySystem!e_root"
  L5_1.FileDropBySystemProc_f_root = "Lua:Context/OpenAfterDropBySystem!f_root"
  L5_1.FileDropBySystemProc_g_root = "Lua:Context/OpenAfterDropBySystem!g_root"
  L5_1.FileDropBySystemProc_h_root = "Lua:Context/OpenAfterDropBySystem!h_root"
  L5_1.FileDropBySystemProc_i_root = "Lua:Context/OpenAfterDropBySystem!i_root"
  L5_1.FileDropBySystemProc_j_root = "Lua:Context/OpenAfterDropBySystem!j_root"
  L5_1.FileDropBySystemProc_k_root = "Lua:Context/OpenAfterDropBySystem!k_root"
  L5_1.FileDropBySystemProc_l_root = "Lua:Context/OpenAfterDropBySystem!l_root"
  L5_1.FileDropBySystemProc_m_root = "Lua:Context/OpenAfterDropBySystem!m_root"
  L5_1.FileDropBySystemProc_n_root = "Lua:Context/OpenAfterDropBySystem!n_root"
  L5_1.FileDropBySystemProc_o_root = "Lua:Context/OpenAfterDropBySystem!o_root"
  L5_1.FileDropBySystemProc_p_root = "Lua:Context/OpenAfterDropBySystem!p_root"
  L5_1.FileDropBySystemProc_q_root = "Lua:Context/OpenAfterDropBySystem!q_root"
  L5_1.FileDropBySystemProc_r_root = "Lua:Context/OpenAfterDropBySystem!r_root"
  L5_1.FileDropBySystemProc_s_root = "Lua:Context/OpenAfterDropBySystem!s_root"
  L5_1.FileDropBySystemProc_t_root = "Lua:Context/OpenAfterDropBySystem!t_root"
  L5_1.FileDropBySystemProc_u_root = "Lua:Context/OpenAfterDropBySystem!u_root"
  L5_1.FileDropBySystemProc_v_root = "Lua:Context/OpenAfterDropBySystem!v_root"
  L5_1.FileDropBySystemProc_w_root = "Lua:Context/OpenAfterDropBySystem!w_root"
  L5_1.FileDropBySystemProc_x_root = "Lua:Context/OpenAfterDropBySystem!x_root"
  L5_1.FileDropBySystemProc_y_root = "Lua:Context/OpenAfterDropBySystem!y_root"
  L5_1.FileDropBySystemProc_z_root = "Lua:Context/OpenAfterDropBySystem!z_root"
  L4_1 = L5_1
end
L5_1 = ipairs
L6_1 = L3_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = pairs
  L11_1 = L4_1
  L10_1, L11_1, L12_1 = L10_1(L11_1)
  for L13_1, L14_1 in L10_1, L11_1, L12_1 do
    if L9_1 == L13_1 then
      L15_1 = mp
      L15_1 = L15_1.set_mpattribute
      L16_1 = L14_1
      L15_1(L16_1)
      L16_1 = L14_1
      L15_1 = L14_1.sub
      L17_1 = -5
      L15_1 = L15_1(L16_1, L17_1)
      if L15_1 == "_root" then
        L15_1 = mp
        L15_1 = L15_1.set_mpattribute
        L16_1 = "Lua:Context/OpenAfterSystemDropsAtRoot"
        L15_1(L16_1)
      end
      L15_1 = mp
      L15_1 = L15_1.INFECTED
      return L15_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
