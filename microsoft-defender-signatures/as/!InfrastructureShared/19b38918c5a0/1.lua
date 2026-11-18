-- Threat: !InfrastructureShared
-- Name: 19b38918c5a0
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].ppid ~= nil then
  local l_0_0 = this_sigattrlog[1].ppid
  TrackPidAndTechniqueBM(l_0_0, "ttexclusion", "ttexclusion_gp")
  return mp.INFECTED
end
return mp.CLEAN
