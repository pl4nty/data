-- Threat: !InfrastructureShared
-- Name: 205408d35ed00
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
