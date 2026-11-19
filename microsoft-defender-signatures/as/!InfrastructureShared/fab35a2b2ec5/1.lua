-- Threat: !InfrastructureShared
-- Name: fab35a2b2ec5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if not this_sigattrlog[6].matched or this_sigattrlog[6].utf8p2 == nil or this_sigattrlog[6].utf8p2 == "" then
  return mp.CLEAN
end
l_0_0 = this_sigattrlog[6].utf8p2
if string.find(l_0_0, " -x ", 1, true) or string.find(string.lower(l_0_0), " -u ", 1, true) or string.find(l_0_0, " -s ", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1087.001", "Discovery_Local_Account_dsmemberutil")
elseif string.find(l_0_0, " -X ", 1, true) or string.find(string.lower(l_0_0), " -g ", 1, true) or string.find(l_0_0, " -S ", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1087.002", "Discovery_Group_Account_dsmemberutil")
else
  TrackPidAndTechniqueBM("BM", "T1087", "Discovery_Group_Account_dsmemberutil")
end
return mp.INFECTED
