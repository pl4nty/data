-- Threat: !InfrastructureShared
-- Name: 11578147215f8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
