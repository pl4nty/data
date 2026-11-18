-- Threat: !InfrastructureShared
-- Name: c029d3e44f9e
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
