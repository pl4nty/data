-- Threat: !InfrastructureShared
-- Name: 12d8dd5812987
-- Type: 21

if not mp.get_mpattribute("BM_MACHO64_FILE") then
  return mp.CLEAN
end
return mp.INFECTED
