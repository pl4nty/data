-- Threat: !InfrastructureShared
-- Name: 9f781b85ad51
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
