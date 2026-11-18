-- Threat: !InfrastructureShared
-- Name: 4078644e52eb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
