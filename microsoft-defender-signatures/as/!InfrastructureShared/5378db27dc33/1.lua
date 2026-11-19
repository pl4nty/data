-- Threat: !InfrastructureShared
-- Name: 5378db27dc33
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
