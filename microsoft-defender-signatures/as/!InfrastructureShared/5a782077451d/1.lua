-- Threat: !InfrastructureShared
-- Name: 5a782077451d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
