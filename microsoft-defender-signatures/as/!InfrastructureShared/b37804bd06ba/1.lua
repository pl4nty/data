-- Threat: !InfrastructureShared
-- Name: b37804bd06ba
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
