-- Threat: !InfrastructureShared
-- Name: 160785b47aa8f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
