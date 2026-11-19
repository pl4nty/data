-- Threat: !InfrastructureShared
-- Name: a1b3ae39c6ef
-- Type: 21
-- Includes: TechniqueTracker

if not this_sigattrlog[1].matched or this_sigattrlog[1].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_3 = string.find(l_0_1, "\\appdata\\local\\temp\\", 1, true) ~= nil or string.find(l_0_1, "\\appdata\\roaming\\", 1, true) ~= nil or string.find(l_0_1, "\\users\\public\\", 1, true) ~= nil or string.find(l_0_1, "\\windows\\temp\\", 1, true) ~= nil or string.find(l_0_1, "\\programdata\\", 1, true) ~= nil
if not l_0_3 then
  return mp.CLEAN
end
bm.add_threat_file(l_0_0)
bm.add_related_string("TimeProviderRedirect", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1547.003", "persist_timeprovider_redirect")
return mp.INFECTED
