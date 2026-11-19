-- Threat: !InfrastructureShared
-- Name: a6785dca2596
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
