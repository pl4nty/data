-- Threat: !InfrastructureShared
-- Name: 6dd708bfe0ea
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if not isIEXfound(l_0_1) then
  return mp.CLEAN
end
if not string.find(l_0_1, "%.downloadstring%(%'?\"?https?%://%d+%.%d+%.%d+%.%d+%:%d+/%w+") then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(string.sub(l_0_2.image_path, -7))
if l_0_3 == "cmd.exe" then
  return mp.INFECTED
end
return mp.CLEAN
