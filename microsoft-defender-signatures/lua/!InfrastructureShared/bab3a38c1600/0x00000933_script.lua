-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bab3a38c1600\0x00000933_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[1]).utf8p2
else
  return mp.CLEAN
end
local l_0_4 = (string.lower)(l_0_2)
if l_0_4 == l_0_3 then
  if (sysio.IsFileExists)(l_0_2) then
    (bm.add_threat_file)(l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN

