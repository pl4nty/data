-- Threat: !InfrastructureShared
-- Name: 4078e9acee24
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
