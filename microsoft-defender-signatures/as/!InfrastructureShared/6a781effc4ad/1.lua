-- Threat: !InfrastructureShared
-- Name: 6a781effc4ad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
