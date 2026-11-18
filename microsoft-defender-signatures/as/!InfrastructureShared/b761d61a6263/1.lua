-- Threat: !InfrastructureShared
-- Name: b761d61a6263
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
