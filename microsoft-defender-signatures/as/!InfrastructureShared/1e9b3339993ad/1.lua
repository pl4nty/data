-- Threat: !InfrastructureShared
-- Name: 1e9b3339993ad
-- Type: 21
-- Includes: TechniqueTracker

if bm.GetSignatureMatchDuration() > 6000000000 then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2].timestamp ~= nil and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].timestamp
  l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
  l_0_2 = this_sigattrlog[2].ppid
end
local l_0_3, l_0_4
if this_sigattrlog[4].matched and this_sigattrlog[4].timestamp ~= nil and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_3 = this_sigattrlog[4].timestamp
  l_0_4 = string.lower(this_sigattrlog[4].utf8p1)
end
if l_0_1 == l_0_4 and l_0_0 < l_0_3 then
  TrackPidAndTechniqueBM(l_0_2, "susp_spoolhack", "priteshel_a")
  return mp.INFECTED
end
return mp.CLEAN
