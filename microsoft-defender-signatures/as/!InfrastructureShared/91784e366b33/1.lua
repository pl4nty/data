-- Threat: !InfrastructureShared
-- Name: 91784e366b33
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
