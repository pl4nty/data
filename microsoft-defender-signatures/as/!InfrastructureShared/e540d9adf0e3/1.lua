-- Threat: !InfrastructureShared
-- Name: e540d9adf0e3
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 16924672 then
  return mp.INFECTED
end
return mp.CLEAN
