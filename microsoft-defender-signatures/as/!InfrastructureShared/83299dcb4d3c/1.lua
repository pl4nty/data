-- Threat: !InfrastructureShared
-- Name: 83299dcb4d3c
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
