-- Threat: !InfrastructureShared
-- Name: c229e8581400
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
