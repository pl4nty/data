-- Threat: !InfrastructureShared
-- Name: 47788c1379dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
