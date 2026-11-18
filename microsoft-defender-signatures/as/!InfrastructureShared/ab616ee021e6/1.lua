-- Threat: !InfrastructureShared
-- Name: ab616ee021e6
-- Type: 21

if peattributes.isexe and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
