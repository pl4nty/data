-- Threat: !InfrastructureShared
-- Name: 2b8c2e6e5e72
-- Type: 21

if mp.get_mpattribute("BM_ELF_REL_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
