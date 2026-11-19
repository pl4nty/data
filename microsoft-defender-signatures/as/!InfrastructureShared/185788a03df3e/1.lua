-- Threat: !InfrastructureShared
-- Name: 185788a03df3e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
