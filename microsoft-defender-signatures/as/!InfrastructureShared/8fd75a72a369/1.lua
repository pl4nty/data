-- Threat: !InfrastructureShared
-- Name: 8fd75a72a369
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
local l_0_2
if l_0_1 then
  l_0_2 = string.match(l_0_1, "wscript.*%s+%\"?%'?(%w:\\.*%.js)")
end
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = MpCommon.PathToWin32Path(l_0_2)
local l_0_3, l_0_4 = mp.GetMotwZoneForFile(l_0_2)
local l_0_5, l_0_6 = mp.GetMotwHostUrlForFile(l_0_2)
if not l_0_6 then
  return mp.CLEAN
end
l_0_6 = string.lower(l_0_6)
if l_0_4 ~= 3 then
  return mp.CLEAN
end
if l_0_6 ~= "about:internet" then
  return mp.CLEAN
end
mp.ReportLowfi(l_0_2, 2228461208)
return mp.INFECTED
