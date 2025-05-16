-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\dcb39fa9ba2e\0x0000088a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5, l_0_6 = nil, nil, nil, nil
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" then
  return mp.CLEAN
end
l_0_3 = (this_sigattrlog[2]).utf8p1
l_0_4 = (this_sigattrlog[2]).utf8p2
if (string.find)(l_0_3, "/Applications/", 1, true) ~= 1 or (string.find)(l_0_4, "/Applications/", 1, true) ~= 1 then
  return mp.CLEAN
end
l_0_5 = (string.match)(l_0_3, "^/.*/")
l_0_6 = (string.match)(l_0_4, "^/.*/")
if l_0_5 == nil and l_0_5 == "" and l_0_6 == nil and l_0_6 == "" then
  return mp.CLEAN
end
if l_0_5 == l_0_6 then
  TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_Masquerading_App")
  return mp.INFECTED
end
return mp.CLEAN

