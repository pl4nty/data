-- Threat: !InfrastructureShared
-- Name: 3f78b9fb56c5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
