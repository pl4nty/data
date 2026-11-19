-- Threat: !InfrastructureShared
-- Name: 89783984e650
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
