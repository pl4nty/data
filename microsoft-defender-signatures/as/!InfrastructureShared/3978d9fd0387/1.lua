-- Threat: !InfrastructureShared
-- Name: 3978d9fd0387
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
