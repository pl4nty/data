-- Threat: !InfrastructureShared
-- Name: 8d7852e13894
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
