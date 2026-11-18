-- Threat: !InfrastructureShared
-- Name: e5409b6c9e57
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
