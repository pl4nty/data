-- Threat: !InfrastructureShared
-- Name: 1a578d4040a64
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
