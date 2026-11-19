-- Threat: !InfrastructureShared
-- Name: 41d7c785560c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if l_0_1 ~= nil then
  local l_0_2 = {
    ".com",
    ".tmp",
    ".jpg",
    ".sldm",
    ".aac",
    ".eml",
    ".html",
    ".pptm",
    ".cab",
    ".eps",
    ".aiff",
    ".wma",
    ".dotx",
    ".gif",
    ".xlam",
    ".mpeg"
  }
  if not contains(l_0_1, l_0_2) then
    return mp.CLEAN
  end
end
return mp.INFECTED
