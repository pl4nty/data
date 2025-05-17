-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\154b33bceb9d0\1_luac 

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
if not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[5]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[5]).utf8p1
if not SuspMacPathsToMonitor(l_0_3, true) then
  return mp.CLEAN
end
local l_0_4 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  l_0_4 = (this_sigattrlog[2]).utf8p2
else
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
    l_0_4 = (this_sigattrlog[3]).utf8p2
  end
end
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_3:match("[^/]*$")
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_4, l_0_5, 1, true) then
  TrackPidAndTechniqueBM("BM", "T1071.002", "CommandAndControl_ApplicationLayerProtocol_FileTransferProtocols")
  return mp.INFECTED
end
return mp.CLEAN

