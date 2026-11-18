-- Threat: !InfrastructureShared
-- Name: 327839435565
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
