-- Threat: !InfrastructureShared
-- Name: 4778672b61da
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
