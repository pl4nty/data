-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b30c3181ee\0x000002f7_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
  l_0_3 = (this_sigattrlog[2]).utf8p1
end
if l_0_3 == nil or #l_0_3 < 4 then
  return mp.CLEAN
end
local l_0_4 = 1768212758
if SuspMacPathsToMonitor(l_0_3, true) then
  (mp.ReportLowfi)(l_0_3, l_0_4)
  ;
  (bm.add_related_file)(l_0_3)
  return mp.INFECTED
end
return mp.CLEAN

