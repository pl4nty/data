-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b33a89a8db\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
local l_0_2 = (bm.get_current_process_startup_info)()
local l_0_3 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_2.command_line) or IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
  l_0_1 = (this_sigattrlog[3]).utf8p2
  if SuspMacPathsToMonitor(l_0_1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN

