-- Threat: !InfrastructureShared
-- Name: 4129897200cb
-- Type: 21

if mp.get_mpattribute("BM_HTA_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
