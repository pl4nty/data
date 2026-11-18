-- Threat: !InfrastructureShared
-- Name: 282780699bb20
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
