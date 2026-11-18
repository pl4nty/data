-- Threat: !InfrastructureShared
-- Name: 268c3da75eaf
-- Type: 21

if mp.get_mpattribute("BM_ELF_CORE_FILE") then
  return mp.CLEAN
end
return mp.INFECTED
