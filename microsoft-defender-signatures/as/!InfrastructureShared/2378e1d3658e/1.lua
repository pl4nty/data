-- Threat: !InfrastructureShared
-- Name: 2378e1d3658e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
