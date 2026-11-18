-- Threat: !InfrastructureShared
-- Name: 2e9783f0bc4a5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
