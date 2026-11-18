-- Threat: !InfrastructureShared
-- Name: f27805d8c407
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
