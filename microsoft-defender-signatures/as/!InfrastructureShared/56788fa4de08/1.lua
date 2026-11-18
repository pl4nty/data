-- Threat: !InfrastructureShared
-- Name: 56788fa4de08
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
