-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb33f96953c\0x00000940_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[2]).utf8p2
if (string.find)(l_0_3, "->(MachO-UniBin", 1, true) then
  l_0_3 = l_0_3:gsub("->%(MachO.+", "")
end
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end
if (sysio.IsFileExists)(l_0_3) then
  (bm.add_threat_file)(l_0_3)
end
TrackPidAndTechniqueBM("BM", "T1555.001", "CredentialAccess_CredentialsfromPasswordStores_Keychain")
return mp.INFECTED

