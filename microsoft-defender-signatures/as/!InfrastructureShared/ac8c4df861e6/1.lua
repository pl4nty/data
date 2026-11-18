-- Threat: !InfrastructureShared
-- Name: ac8c4df861e6
-- Type: 21

if mp.get_mpattribute("BM_ELF_CORE_FILE") then
  return mp.CLEAN
end
return mp.INFECTED
