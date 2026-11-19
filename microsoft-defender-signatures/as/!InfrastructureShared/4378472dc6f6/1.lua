-- Threat: !InfrastructureShared
-- Name: 4378472dc6f6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
