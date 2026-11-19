-- Threat: !InfrastructureShared
-- Name: 2078cf363f9d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
