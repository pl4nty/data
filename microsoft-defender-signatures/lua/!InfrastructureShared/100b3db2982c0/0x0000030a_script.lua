-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\100b3db2982c0\0x0000030a_luac 

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
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[4]).utf8p2 == "" or not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[5]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[4]).utf8p2
local l_0_4 = (this_sigattrlog[5]).utf8p1
local l_0_5 = (string.match)(l_0_4, "(.+%.app)/.+")
if l_0_5 ~= nil and (string.find)(l_0_3, l_0_5, 1, true) and SuspMacPathsToMonitor(l_0_4, true) then
  if (sysio.IsFileExists)(l_0_4) then
    (bm.add_threat_file)(l_0_4)
  end
  return mp.INFECTED
end
return mp.CLEAN

