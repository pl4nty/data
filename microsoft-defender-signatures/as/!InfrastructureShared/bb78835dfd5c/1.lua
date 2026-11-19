-- Threat: !InfrastructureShared
-- Name: bb78835dfd5c
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
