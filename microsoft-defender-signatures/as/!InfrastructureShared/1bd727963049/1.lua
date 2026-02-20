-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bd727963049\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if not StringStartsWith(l_0_1, "insmod ") then
  return mp.CLEAN
end
local l_0_2 = (mp.GetExecutablesFromCommandLine)(l_0_1)
if l_0_2 ~= nil then
  for l_0_6,l_0_7 in ipairs(l_0_2) do
    if (sysio.IsFileExists)(l_0_7) then
      (mp.ReportLowfi)(l_0_7, 1690978323)
    end
  end
end
do
  return mp.INFECTED
end

