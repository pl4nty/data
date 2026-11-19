-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/OpenAfterDropBySystem.C
-- Type: 24
-- Includes: TechniqueTracker
-- MpAttributes: Lua:OpenAfterDropBySystem

if mp.ENGINEBUILD > 19850 and not mp.get_mpattribute("Lua:RemoteContextPresent") then
  mp.set_mpattribute("Lua:RemoteCopyExclusions")
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0:sub(1, 8) == "\\device\\" then
  l_0_0 = MpCommon.PathToWin32Path(l_0_0)
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
mp.set_mpattribute("Lua:Context/OpenAfterDropBySysproc!" .. l_0_1)
local l_0_2 = "cscript.exe|wscript.exe|mshta.exe|cmd.exe|powershell.exe|pwsh.exe|console.exe|bash.exe|dllhost.exe|rundll32.exe|regsvr32.exe|wmiprvse.exe|svchost.exe|wsmprovhost.exe|"
if l_0_2:find(l_0_1) then
  mp.set_mpattribute("Lua:Context/SuspOpenAfterDropBySysproc!lolbin")
  mp.set_mpattribute("Lua:Context/SuspOpenAfterDropBySysproc!" .. l_0_1)
  TrackPidAndTechnique("RTP", "T1570", "exec_remotedroppedscript_a")
end
local l_0_3 = MpCommon.GetPersistContext(l_0_0)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4
if mp.get_mpattribute("BM_MZ_FILE") then
  l_0_4 = {
    ExeFileDropBySystemProc_sysdir = "Lua:Context/OpenExeAfterDropBySystem!sysdir",
    ExeFileDropBySystemProc_windir = "Lua:Context/OpenExeAfterDropBySystem!windir",
    ExeFileDropBySystemProc_wintemp = "Lua:Context/OpenExeAfterDropBySystem!wintemp",
    ExeFileDropBySystemProc_startup = "Lua:Context/OpenExeAfterDropBySystem!startup",
    ExeFileDropBySystemProc_desktop = "Lua:Context/OpenExeAfterDropBySystem!desktop",
    ExeFileDropBySystemProc_appdatalocal = "Lua:Context/OpenExeAfterDropBySystem!appdatalocal",
    ExeFileDropBySystemProc_usrtemp = "Lua:Context/OpenExeAfterDropBySystem!usrtemp",
    ExeFileDropBySystemProc_sysprof = "Lua:Context/OpenExeAfterDropBySystem!sysprof",
    ExeFileDropBySystemProc_sysappdata = "Lua:Context/OpenExeAfterDropBySystem!sysappdata",
    ExeFileDropBySystemProc_usrprofpub = "Lua:Context/OpenExeAfterDropBySystem!usrprofpub",
    ExeFileDropBySystemProc_usrprofdef = "Lua:Context/OpenExeAfterDropBySystem!usrprofdef",
    ExeFileDropBySystemProc_perflog = "Lua:Context/OpenExeAfterDropBySystem!perflog",
    ExeFileDropBySystemProc_spool = "Lua:Context/OpenExeAfterDropBySystem!spool",
    ExeFileDropBySystemProc_c_root = "Lua:Context/OpenExeAfterDropBySystem!c_root",
    ExeFileDropBySystemProc_d_root = "Lua:Context/OpenExeAfterDropBySystem!d_root",
    ExeFileDropBySystemProc_e_root = "Lua:Context/OpenExeAfterDropBySystem!e_root",
    ExeFileDropBySystemProc_f_root = "Lua:Context/OpenExeAfterDropBySystem!f_root",
    ExeFileDropBySystemProc_g_root = "Lua:Context/OpenExeAfterDropBySystem!g_root",
    ExeFileDropBySystemProc_h_root = "Lua:Context/OpenExeAfterDropBySystem!h_root",
    ExeFileDropBySystemProc_i_root = "Lua:Context/OpenExeAfterDropBySystem!i_root",
    ExeFileDropBySystemProc_j_root = "Lua:Context/OpenExeAfterDropBySystem!j_root",
    ExeFileDropBySystemProc_k_root = "Lua:Context/OpenExeAfterDropBySystem!k_root",
    ExeFileDropBySystemProc_l_root = "Lua:Context/OpenExeAfterDropBySystem!l_root",
    ExeFileDropBySystemProc_m_root = "Lua:Context/OpenExeAfterDropBySystem!m_root",
    ExeFileDropBySystemProc_n_root = "Lua:Context/OpenExeAfterDropBySystem!n_root",
    ExeFileDropBySystemProc_o_root = "Lua:Context/OpenExeAfterDropBySystem!o_root",
    ExeFileDropBySystemProc_p_root = "Lua:Context/OpenExeAfterDropBySystem!p_root",
    ExeFileDropBySystemProc_q_root = "Lua:Context/OpenExeAfterDropBySystem!q_root",
    ExeFileDropBySystemProc_r_root = "Lua:Context/OpenExeAfterDropBySystem!r_root",
    ExeFileDropBySystemProc_s_root = "Lua:Context/OpenExeAfterDropBySystem!s_root",
    ExeFileDropBySystemProc_t_root = "Lua:Context/OpenExeAfterDropBySystem!t_root",
    ExeFileDropBySystemProc_u_root = "Lua:Context/OpenExeAfterDropBySystem!u_root",
    ExeFileDropBySystemProc_v_root = "Lua:Context/OpenExeAfterDropBySystem!v_root",
    ExeFileDropBySystemProc_w_root = "Lua:Context/OpenExeAfterDropBySystem!w_root",
    ExeFileDropBySystemProc_x_root = "Lua:Context/OpenExeAfterDropBySystem!x_root",
    ExeFileDropBySystemProc_y_root = "Lua:Context/OpenExeAfterDropBySystem!y_root",
    ExeFileDropBySystemProc_z_root = "Lua:Context/OpenExeAfterDropBySystem!z_root"
  }
else
  l_0_4 = {
    FileDropBySystemProc_sysdir = "Lua:Context/OpenAfterDropBySystem!sysdir",
    FileDropBySystemProc_windir = "Lua:Context/OpenAfterDropBySystem!windir",
    FileDropBySystemProc_wintemp = "Lua:Context/OpenAfterDropBySystem!wintemp",
    FileDropBySystemProc_startup = "Lua:Context/OpenAfterDropBySystem!startup",
    FileDropBySystemProc_desktop = "Lua:Context/OpenAfterDropBySystem!desktop",
    FileDropBySystemProc_appdatalocal = "Lua:Context/OpenAfterDropBySystem!appdatalocal",
    FileDropBySystemProc_usrtemp = "Lua:Context/OpenAfterDropBySystem!usrtemp",
    FileDropBySystemProc_sysprof = "Lua:Context/OpenAfterDropBySystem!sysprof",
    FileDropBySystemProc_sysappdata = "Lua:Context/OpenAfterDropBySystem!sysappdata",
    FileDropBySystemProc_usrprofpub = "Lua:Context/OpenAfterDropBySystem!usrprofpub",
    FileDropBySystemProc_usrprofdef = "Lua:Context/OpenAfterDropBySystem!usrprofdef",
    FileDropBySystemProc_perflog = "Lua:Context/OpenAfterDropBySystem!perflog",
    FileDropBySystemProc_spool = "Lua:Context/OpenAfterDropBySystem!spool",
    FileDropBySystemProc_c_root = "Lua:Context/OpenAfterDropBySystem!c_root",
    FileDropBySystemProc_d_root = "Lua:Context/OpenAfterDropBySystem!d_root",
    FileDropBySystemProc_e_root = "Lua:Context/OpenAfterDropBySystem!e_root",
    FileDropBySystemProc_f_root = "Lua:Context/OpenAfterDropBySystem!f_root",
    FileDropBySystemProc_g_root = "Lua:Context/OpenAfterDropBySystem!g_root",
    FileDropBySystemProc_h_root = "Lua:Context/OpenAfterDropBySystem!h_root",
    FileDropBySystemProc_i_root = "Lua:Context/OpenAfterDropBySystem!i_root",
    FileDropBySystemProc_j_root = "Lua:Context/OpenAfterDropBySystem!j_root",
    FileDropBySystemProc_k_root = "Lua:Context/OpenAfterDropBySystem!k_root",
    FileDropBySystemProc_l_root = "Lua:Context/OpenAfterDropBySystem!l_root",
    FileDropBySystemProc_m_root = "Lua:Context/OpenAfterDropBySystem!m_root",
    FileDropBySystemProc_n_root = "Lua:Context/OpenAfterDropBySystem!n_root",
    FileDropBySystemProc_o_root = "Lua:Context/OpenAfterDropBySystem!o_root",
    FileDropBySystemProc_p_root = "Lua:Context/OpenAfterDropBySystem!p_root",
    FileDropBySystemProc_q_root = "Lua:Context/OpenAfterDropBySystem!q_root",
    FileDropBySystemProc_r_root = "Lua:Context/OpenAfterDropBySystem!r_root",
    FileDropBySystemProc_s_root = "Lua:Context/OpenAfterDropBySystem!s_root",
    FileDropBySystemProc_t_root = "Lua:Context/OpenAfterDropBySystem!t_root",
    FileDropBySystemProc_u_root = "Lua:Context/OpenAfterDropBySystem!u_root",
    FileDropBySystemProc_v_root = "Lua:Context/OpenAfterDropBySystem!v_root",
    FileDropBySystemProc_w_root = "Lua:Context/OpenAfterDropBySystem!w_root",
    FileDropBySystemProc_x_root = "Lua:Context/OpenAfterDropBySystem!x_root",
    FileDropBySystemProc_y_root = "Lua:Context/OpenAfterDropBySystem!y_root",
    FileDropBySystemProc_z_root = "Lua:Context/OpenAfterDropBySystem!z_root"
  }
end
for l_0_5, l_0_6 in ipairs(l_0_3) do
  for l_0_7, l_0_8 in pairs(l_0_4) do
    if l_0_6 == l_0_7 then
      mp.set_mpattribute(l_0_8)
      if l_0_8:sub(-5) == "_root" then
        mp.set_mpattribute("Lua:Context/OpenAfterSystemDropsAtRoot")
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
