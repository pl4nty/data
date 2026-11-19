-- Threat: !InfrastructureShared
-- Name: 3878ce0d0d34
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
