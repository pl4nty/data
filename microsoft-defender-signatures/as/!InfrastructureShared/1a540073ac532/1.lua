-- Threat: !InfrastructureShared
-- Name: 1a540073ac532
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
