-- Threat: !InfrastructureShared
-- Name: 1a540af2ca6b0
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[MSILRES:_]") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
