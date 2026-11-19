-- Threat: !InfrastructureShared
-- Name: 9578e1a133ea
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
