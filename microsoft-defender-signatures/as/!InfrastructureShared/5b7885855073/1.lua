-- Threat: !InfrastructureShared
-- Name: 5b7885855073
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
