-- Threat: !InfrastructureShared
-- Name: 6878f41f3263
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
