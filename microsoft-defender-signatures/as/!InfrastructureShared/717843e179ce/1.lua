-- Threat: !InfrastructureShared
-- Name: 717843e179ce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
