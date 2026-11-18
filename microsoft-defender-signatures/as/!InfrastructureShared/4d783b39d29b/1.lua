-- Threat: !InfrastructureShared
-- Name: 4d783b39d29b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
