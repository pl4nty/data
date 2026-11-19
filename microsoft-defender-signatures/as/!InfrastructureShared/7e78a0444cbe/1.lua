-- Threat: !InfrastructureShared
-- Name: 7e78a0444cbe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
