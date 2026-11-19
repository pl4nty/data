-- Threat: !InfrastructureShared
-- Name: 4d782842c187
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
