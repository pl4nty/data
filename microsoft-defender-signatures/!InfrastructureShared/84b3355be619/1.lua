-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3355be619\1.luac 

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
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[2]).utf8p2
if SuspMacPathsToMonitor(l_0_3, true) then
  TrackPidAndTechniqueBM("BM", "T1573.002", "CommandAndControl_EncryptedChannel_AsymmetricCryptography")
  return mp.INFECTED
end
return mp.CLEAN

