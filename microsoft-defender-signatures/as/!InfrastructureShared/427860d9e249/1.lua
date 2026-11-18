-- Threat: !InfrastructureShared
-- Name: 427860d9e249
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
