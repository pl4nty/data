-- Threat: !InfrastructureShared
-- Name: 8178e3a82f8c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
