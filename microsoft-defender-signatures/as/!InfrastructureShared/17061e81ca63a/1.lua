-- Threat: !InfrastructureShared
-- Name: 17061e81ca63a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
