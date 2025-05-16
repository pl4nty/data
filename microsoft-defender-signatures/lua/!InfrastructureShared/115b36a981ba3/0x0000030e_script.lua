-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\115b36a981ba3\0x0000030e_luac 

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
local l_0_3 = (bm.get_connection_string)()
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_3, "Uri=([^;]*);")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
local l_0_5 = (string.match)(l_0_4, "://([^/:]+%.kr)/")
if l_0_5 == nil then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p2 == nil or (this_sigattrlog[3]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_6 = (this_sigattrlog[3]).utf8p2
local l_0_7 = nil
if (this_sigattrlog[5]).matched then
  l_0_7 = (this_sigattrlog[5]).utf8p2
else
  if (this_sigattrlog[6]).matched then
    l_0_7 = (this_sigattrlog[6]).utf8p2
  end
end
if l_0_7 == nil or l_0_7 == "" then
  return mp.CLEAN
end
local l_0_8 = l_0_6:match("[^/]*$")
if not (string.find)(l_0_7, l_0_8, 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

