-- Threat: !InfrastructureShared
-- Name: 567830f23c3f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
