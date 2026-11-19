-- Threat: !InfrastructureShared
-- Name: 3e290617223d
-- Type: 21

if mp.get_mpattribute("BM_UNKNOWN_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
