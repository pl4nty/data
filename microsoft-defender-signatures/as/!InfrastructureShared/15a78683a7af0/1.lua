-- Threat: !InfrastructureShared
-- Name: 15a78683a7af0
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_boundimport") and mp.getfilesize() >= 2404352 and mp.getfilesize() < 2428928 then
  return mp.INFECTED
end
return mp.CLEAN
