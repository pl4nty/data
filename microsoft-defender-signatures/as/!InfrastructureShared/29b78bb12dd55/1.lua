-- Threat: !InfrastructureShared
-- Name: 29b78bb12dd55
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
