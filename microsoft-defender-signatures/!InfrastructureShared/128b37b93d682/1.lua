-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\128b37b93d682\1.luac 

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
if not (this_sigattrlog[6]).matched or not (this_sigattrlog[7]).matched or (this_sigattrlog[6]).utf8p2 == nil or (this_sigattrlog[6]).utf8p2 == "" or (this_sigattrlog[7]).utf8p2 == nil or (this_sigattrlog[7]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[6]).utf8p2
local l_0_4 = (this_sigattrlog[7]).utf8p2
if l_0_3 == l_0_4 and SuspMacPathsToMonitor(l_0_3, true) then
  if (sysio.IsFileExists)(l_0_3) then
    (bm.add_threat_file)(l_0_3)
  end
  if (SuspMacPathsToMonitor(l_0_2, true) or (string.find)(l_0_2, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_2, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_2, "/Users/[^/]+/Desktop/", 1, false)) and (sysio.IsFileExists)(l_0_2) then
    (bm.add_threat_file)(l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN

