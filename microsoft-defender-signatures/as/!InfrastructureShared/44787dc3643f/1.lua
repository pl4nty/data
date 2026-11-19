-- Threat: !InfrastructureShared
-- Name: 44787dc3643f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
