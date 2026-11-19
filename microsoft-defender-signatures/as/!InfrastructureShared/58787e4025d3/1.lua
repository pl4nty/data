-- Threat: !InfrastructureShared
-- Name: 58787e4025d3
-- Type: 21

if peattributes.isexe and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
