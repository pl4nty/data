-- Threat: !InfrastructureShared
-- Name: 8540f465acb6
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
