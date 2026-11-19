-- Threat: !InfrastructureShared
-- Name: 5078147a591e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
