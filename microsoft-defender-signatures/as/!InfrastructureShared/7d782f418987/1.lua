-- Threat: !InfrastructureShared
-- Name: 7d782f418987
-- Type: 21

if mp.HSTR_WEIGHT >= 2 and not mp.get_mpattribute("deep_analysis") then
  pe.set_peattribute("deep_analysis", true)
  pe.reemulate()
end
mp.set_mpattribute("PUA:Block:BrowseFox")
return mp.INFECTED
