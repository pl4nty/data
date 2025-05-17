-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b332ce6c13\1_luac 

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
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[3]).utf8p2
if not SuspMacPathsToMonitor(l_0_3, true) then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("mac_scp_file_transfer", "file_transferred_path", l_0_3) then
  (bm.trigger_sig)("BM_ScpChmodNExecute", l_0_3)
  return mp.INFECTED
end
return mp.CLEAN

