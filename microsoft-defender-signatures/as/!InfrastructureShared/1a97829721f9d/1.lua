-- Threat: !InfrastructureShared
-- Name: 1a97829721f9d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
