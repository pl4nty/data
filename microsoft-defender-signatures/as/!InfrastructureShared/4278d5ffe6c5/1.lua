-- Threat: !InfrastructureShared
-- Name: 4278d5ffe6c5
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
