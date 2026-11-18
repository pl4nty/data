-- Threat: !InfrastructureShared
-- Name: 8540ca6c337d
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
