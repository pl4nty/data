-- Threat: !InfrastructureShared
-- Name: 47784243a335
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
