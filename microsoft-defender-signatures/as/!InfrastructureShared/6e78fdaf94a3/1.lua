-- Threat: !InfrastructureShared
-- Name: 6e78fdaf94a3
-- Type: 21

if mp.get_mpattribute("BM_MZ_FILE") and pehdr.NumberOfSections > 8 and pesecs[6].VirtualSize > 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
