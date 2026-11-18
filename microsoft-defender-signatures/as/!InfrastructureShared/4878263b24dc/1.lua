-- Threat: !InfrastructureShared
-- Name: 4878263b24dc
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
