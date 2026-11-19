-- Threat: !InfrastructureShared
-- Name: 44781662c831
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
