-- Threat: !InfrastructureShared
-- Name: 1398da98407ed
-- Type: 21

if not mp.get_mpattribute("BM_MACHO64_FILE") then
  return mp.CLEAN
end
return mp.INFECTED
