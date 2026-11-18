-- Threat: !InfrastructureShared
-- Name: 8540bdb21f82
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[MSILRES:_]") and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
