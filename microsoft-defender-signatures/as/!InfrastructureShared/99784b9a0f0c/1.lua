-- Threat: !InfrastructureShared
-- Name: 99784b9a0f0c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
