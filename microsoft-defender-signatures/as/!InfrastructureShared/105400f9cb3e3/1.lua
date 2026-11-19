-- Threat: !InfrastructureShared
-- Name: 105400f9cb3e3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
