-- Threat: !InfrastructureShared
-- Name: 4961ab929a34
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
