-- Threat: !InfrastructureShared
-- Name: 717889495689
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
