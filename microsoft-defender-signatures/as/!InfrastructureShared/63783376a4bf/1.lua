-- Threat: !InfrastructureShared
-- Name: 63783376a4bf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
