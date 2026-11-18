-- Threat: !InfrastructureShared
-- Name: b27804c75272
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
