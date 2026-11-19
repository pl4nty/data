-- Threat: !InfrastructureShared
-- Name: 9c784e602a79
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
