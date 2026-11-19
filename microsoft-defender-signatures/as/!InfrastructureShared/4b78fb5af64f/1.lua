-- Threat: !InfrastructureShared
-- Name: 4b78fb5af64f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
