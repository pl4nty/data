-- Threat: !InfrastructureShared
-- Name: 354050b8b3ad
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
