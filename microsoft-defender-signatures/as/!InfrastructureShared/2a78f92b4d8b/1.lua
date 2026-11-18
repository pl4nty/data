-- Threat: !InfrastructureShared
-- Name: 2a78f92b4d8b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
