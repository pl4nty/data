-- Threat: !InfrastructureShared
-- Name: d778bb93013e
-- Type: 21

if mp.get_mpattribute("BM_MZ_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
