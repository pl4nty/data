-- Threat: !InfrastructureShared
-- Name: 377804dc9903
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
