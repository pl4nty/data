-- Threat: !InfrastructureShared
-- Name: 8f29f12ebc70
-- Type: 21

if mp.get_mpattribute("BM_LNK_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
