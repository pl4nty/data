-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d2b34658ab17\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[1]).utf8p2
else
  return mp.CLEAN
end
local l_0_4 = nil
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" then
  l_0_4 = (this_sigattrlog[4]).utf8p2
else
  return mp.CLEAN
end
local l_0_5 = (string.lower)(l_0_3)
if l_0_5 == l_0_4 then
  if (sysio.IsFileExists)(l_0_3) then
    (bm.add_threat_file)(l_0_3)
  end
  return mp.INFECTED
end
return mp.CLEAN

