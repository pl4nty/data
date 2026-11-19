-- Threat: !InfrastructureShared
-- Name: 9f78b32a2e4e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
