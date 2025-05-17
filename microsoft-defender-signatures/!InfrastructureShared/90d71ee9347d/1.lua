-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\90d71ee9347d\1.luac 

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
l_0_2 = (string.lower)(l_0_2)
if (string.find)(l_0_2, "rundll32.exe", 1, true) then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
do
  if l_0_3 ~= nil then
    local l_0_4 = (string.lower)(l_0_3.image_path)
    if l_0_4 ~= nil and (string.find)(l_0_4, "powershell.exe", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

