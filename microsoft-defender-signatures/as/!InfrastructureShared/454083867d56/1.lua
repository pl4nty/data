-- Threat: !InfrastructureShared
-- Name: 454083867d56
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
