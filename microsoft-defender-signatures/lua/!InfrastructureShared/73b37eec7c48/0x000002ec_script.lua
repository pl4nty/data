-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b37eec7c48\0x000002ec_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  local l_0_0 = (bm.get_current_process_startup_info)()
  local l_0_1 = l_0_0.command_line
  local l_0_2 = (bm.get_imagepath)()
  if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = (this_sigattrlog[2]).utf8p2
  if SuspMacPathsToMonitor(l_0_3, true) and l_0_3:match("/%.[^/]+$") then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

