-- Threat: !InfrastructureShared
-- Name: 20078e10baffd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
