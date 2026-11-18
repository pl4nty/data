-- Threat: !InfrastructureShared
-- Name: 6a781490c2a0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
