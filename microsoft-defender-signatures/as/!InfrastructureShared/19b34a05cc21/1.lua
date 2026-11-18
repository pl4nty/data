-- Threat: !InfrastructureShared
-- Name: 19b34a05cc21
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 ~= nil then
    local l_0_1 = {
      "T1105:ingress_tool",
      "T1105:BmRDPFileCopyIn"
    }
    TrackFileAndTechnique(l_0_0, l_0_1)
  end
end
return mp.INFECTED
