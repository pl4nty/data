-- Threat: !InfrastructureShared
-- Name: 50290f89dfb8
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
