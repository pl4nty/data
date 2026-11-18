-- Threat: !InfrastructureShared
-- Name: 4778b8c2f8b4
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
