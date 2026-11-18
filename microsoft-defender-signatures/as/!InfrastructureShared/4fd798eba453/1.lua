-- Threat: !InfrastructureShared
-- Name: 4fd798eba453
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if l_0_1 ~= nil then
  local l_0_2 = {
    "msmpeng.exe",
    "ntrtscan.exe",
    "avp.exe",
    "wrsa.exe",
    "egui.exe",
    "avastui.exe"
  }
  if not contains(l_0_1, l_0_2) then
    return mp.CLEAN
  end
end
return mp.INFECTED
