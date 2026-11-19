-- Threat: !InfrastructureShared
-- Name: 2c341e015f197
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
