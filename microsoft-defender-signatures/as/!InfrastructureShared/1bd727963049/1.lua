-- Threat: !InfrastructureShared
-- Name: 1bd727963049
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if not StringStartsWith(l_0_1, "insmod ") then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) then
      mp.ReportLowfi(l_0_4, 1690978323)
    end
  end
end
return mp.INFECTED
