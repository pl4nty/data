-- Threat: !InfrastructureShared
-- Name: ab7864402db1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
