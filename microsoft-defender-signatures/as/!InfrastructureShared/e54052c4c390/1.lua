-- Threat: !InfrastructureShared
-- Name: e54052c4c390
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
