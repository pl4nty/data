-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\31d7e460faad\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (MpCommon.GetOriginalFileName)(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3 == "finger.exe" and not (string.find)((string.lower)(l_0_2), "finger.exe", 1, true) then
  local l_0_4 = (mp.GetParentProcInfo)()
  if l_0_4 ~= nil then
    if l_0_4.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_4.ppid, true) then
      return mp.INFECTED
    else
      local l_0_5 = (mp.GetParentProcInfo)(l_0_4.ppid)
      if l_0_5 ~= nil and l_0_5.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_5.ppid, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

