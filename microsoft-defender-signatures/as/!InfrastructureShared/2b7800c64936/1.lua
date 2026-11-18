-- Threat: !InfrastructureShared
-- Name: 2b7800c64936
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
