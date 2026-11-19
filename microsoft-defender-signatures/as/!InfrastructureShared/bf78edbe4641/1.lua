-- Threat: !InfrastructureShared
-- Name: bf78edbe4641
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
