-- Threat: !InfrastructureShared
-- Name: 4178d0e34607
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
