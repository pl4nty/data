-- Threat: !InfrastructureShared
-- Name: ab7894ad629f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
