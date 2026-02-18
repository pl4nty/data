-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10bb3113a8159\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
  l_0_3 = (string.lower)((this_sigattrlog[3]).utf8p2)
end
if (string.find)(l_0_3, "http", 1, true) and (string.find)(l_0_3, ".pages.dev/", 1, true) and (string.find)(l_0_3, ".aspx -o ", 1, true) and (string.find)(l_0_3, "/library/application support/", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

