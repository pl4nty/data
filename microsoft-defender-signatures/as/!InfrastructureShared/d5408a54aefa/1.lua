-- Threat: !InfrastructureShared
-- Name: d5408a54aefa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
