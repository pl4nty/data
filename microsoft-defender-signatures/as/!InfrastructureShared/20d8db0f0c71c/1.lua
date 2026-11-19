-- Threat: !InfrastructureShared
-- Name: 20d8db0f0c71c
-- Type: 21

if not mp.get_mpattribute("BM_MACHO64_FILE") then
  return mp.CLEAN
end
return mp.INFECTED
