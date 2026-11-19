-- Threat: !InfrastructureShared
-- Name: 63d7696975e8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  "bookvrfsrv.com",
  "hotel-vellir.com",
  "mvrfbkn.com",
  "tvrfbookn.com",
  "vrfbknsr.com",
  "xbookvrf.com",
  "bokcentrpart.com"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
return mp.CLEAN
