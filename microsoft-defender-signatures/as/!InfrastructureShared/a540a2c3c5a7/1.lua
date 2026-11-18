-- Threat: !InfrastructureShared
-- Name: a540a2c3c5a7
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
