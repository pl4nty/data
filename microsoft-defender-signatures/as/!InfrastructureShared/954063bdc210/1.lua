-- Threat: !InfrastructureShared
-- Name: 954063bdc210
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
