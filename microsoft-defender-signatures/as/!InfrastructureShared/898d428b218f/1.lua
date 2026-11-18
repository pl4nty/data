-- Threat: !InfrastructureShared
-- Name: 898d428b218f
-- Type: 21

if not mp.get_mpattribute("BM_MACHO64_FILE") then
  return mp.CLEAN
end
return mp.INFECTED
