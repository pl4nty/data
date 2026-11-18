-- Threat: !InfrastructureShared
-- Name: 11178d1829b62
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
