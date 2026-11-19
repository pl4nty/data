-- Threat: !InfrastructureShared
-- Name: 6e8d305d292b
-- Type: 21

if not mp.get_mpattribute("BM_MACHO64_FILE") then
  return mp.CLEAN
end
return mp.INFECTED
