-- Threat: !InfrastructureShared
-- Name: 8f8c63bf1b63
-- Type: 21

if mp.get_mpattribute("BM_ELF_DYN_FILE") or mp.get_mpattribute("elfa_isharedlib") then
  return mp.INFECTED
end
return mp.CLEAN
