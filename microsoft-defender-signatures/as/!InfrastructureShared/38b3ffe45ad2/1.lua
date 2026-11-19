-- Threat: !InfrastructureShared
-- Name: 38b3ffe45ad2
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  if string.match(l_0_0, "^%./%.[^/]+$") then
    TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HiddenArtifacts_mt2023")
  elseif string.match(l_0_0, "/%.[^/]+$") and isTainted(l_0_0, "remote_file_created_taint") then
    TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HiddenArtifacts_mt2023")
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
