-- Threat: !InfrastructureShared
-- Name: 977877996564
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
