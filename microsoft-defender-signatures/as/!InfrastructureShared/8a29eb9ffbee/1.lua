-- Threat: !InfrastructureShared
-- Name: 8a29eb9ffbee
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
