-- Threat: !InfrastructureShared
-- Name: 90789d323cac
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
