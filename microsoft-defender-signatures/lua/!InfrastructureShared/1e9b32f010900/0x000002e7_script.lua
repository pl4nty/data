-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e9b32f010900\0x000002e7_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil and (this_sigattrlog[9]).utf8p1 ~= "" then
  local l_0_0 = (bm.get_current_process_startup_info)()
  local l_0_1 = (bm.get_imagepath)()
  local l_0_2 = l_0_0.command_line
  if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) then
    return mp.CLEAN
  end
  local l_0_3 = (this_sigattrlog[9]).utf8p1
  if SuspMacPathsToMonitor(l_0_3, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

