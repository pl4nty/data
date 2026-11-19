-- Threat: !InfrastructureShared
-- Name: 37785695c340
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
