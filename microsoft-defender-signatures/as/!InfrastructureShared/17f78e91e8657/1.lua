-- Threat: !InfrastructureShared
-- Name: 17f78e91e8657
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
