-- Threat: !InfrastructureShared
-- Name: 2278fd278a85
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
