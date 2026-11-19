-- Threat: !InfrastructureShared
-- Name: 5578c1dcff3f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
