-- Threat: !InfrastructureShared
-- Name: 554067ca1da4
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
