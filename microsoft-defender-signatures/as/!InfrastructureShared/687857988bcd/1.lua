-- Threat: !InfrastructureShared
-- Name: 687857988bcd
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
