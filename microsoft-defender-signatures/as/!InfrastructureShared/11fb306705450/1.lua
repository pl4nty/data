-- Threat: !InfrastructureShared
-- Name: 11fb306705450
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = ""
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p1 ~= "" then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p1 ~= "" then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p1 ~= "" then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
end
if l_0_0 ~= "" and (string.find(l_0_0, "/users/shared/", 1, true) == 1 or string.find(l_0_0, "/library/metadata/", 1, true) == 1 or string.find(l_0_0, "/private/var/db/diagnostics", 1, true) == 1) then
  mp.set_mpattribute("BM_FileDeletion")
  TrackPidAndTechniqueBM("BM", "T1070.004", "DefenseEvasion_IndicatorRemoval_DeleteFileInterpreter")
  return mp.INFECTED
end
return mp.CLEAN
