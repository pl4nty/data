-- Threat: !InfrastructureShared
-- Name: 347831d18206
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
