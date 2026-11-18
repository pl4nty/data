-- Threat: !InfrastructureShared
-- Name: 4c7840de7a3b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
