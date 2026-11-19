-- Threat: !InfrastructureShared
-- Name: 3c783370ac5f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
