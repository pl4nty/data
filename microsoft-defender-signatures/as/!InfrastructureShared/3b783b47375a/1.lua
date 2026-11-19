-- Threat: !InfrastructureShared
-- Name: 3b783b47375a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
