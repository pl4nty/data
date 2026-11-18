-- Threat: !InfrastructureShared
-- Name: 2fd786b2ffcbe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
