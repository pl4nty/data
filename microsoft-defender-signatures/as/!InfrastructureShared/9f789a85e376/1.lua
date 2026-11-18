-- Threat: !InfrastructureShared
-- Name: 9f789a85e376
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
