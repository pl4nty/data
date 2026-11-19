-- Threat: !InfrastructureShared
-- Name: f77805e51eb1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
