-- Threat: !InfrastructureShared
-- Name: 7e7877e05225
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
