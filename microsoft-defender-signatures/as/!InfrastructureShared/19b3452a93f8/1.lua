-- Threat: !InfrastructureShared
-- Name: 19b3452a93f8
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched and this_sigattrlog[1].ppid ~= nil then
  local l_0_0 = this_sigattrlog[1].ppid
  TrackPidAndTechniqueBM(l_0_0, "ttexclusion", "ttexclusion_ccm")
  return mp.INFECTED
end
return mp.CLEAN
