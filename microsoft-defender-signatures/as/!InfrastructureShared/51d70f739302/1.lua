-- Threat: !InfrastructureShared
-- Name: 51d70f739302
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
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil and l_0_2.image_path ~= nil then
  local l_0_3 = string.lower(l_0_2.image_path)
  if l_0_3:match("([^\\]+)$") == "explorer.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
