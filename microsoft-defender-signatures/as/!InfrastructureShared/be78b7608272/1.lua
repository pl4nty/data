-- Threat: !InfrastructureShared
-- Name: be78b7608272
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
