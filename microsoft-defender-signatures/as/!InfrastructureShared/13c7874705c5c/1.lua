-- Threat: !InfrastructureShared
-- Name: 13c7874705c5c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
