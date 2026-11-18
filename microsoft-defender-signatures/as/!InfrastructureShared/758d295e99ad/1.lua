-- Threat: !InfrastructureShared
-- Name: 758d295e99ad
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 49920 and 49152 < l_0_0 and mp.get_mpattribute("BM_MACHO64_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
