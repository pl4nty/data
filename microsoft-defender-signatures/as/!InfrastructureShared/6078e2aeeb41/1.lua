-- Threat: !InfrastructureShared
-- Name: 6078e2aeeb41
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
