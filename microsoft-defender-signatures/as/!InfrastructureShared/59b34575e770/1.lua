-- Threat: !InfrastructureShared
-- Name: 59b34575e770
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or #l_0_0 <= 15 or string.sub(l_0_0, -12) ~= "\\spoolsv.exe" then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "tt_remediate", "priteshell_malware")
return mp.INFECTED
