-- Threat: !InfrastructureShared
-- Name: 2878391cc009
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
