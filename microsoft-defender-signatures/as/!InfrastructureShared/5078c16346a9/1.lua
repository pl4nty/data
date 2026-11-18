-- Threat: !InfrastructureShared
-- Name: 5078c16346a9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
