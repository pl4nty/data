-- Threat: !InfrastructureShared
-- Name: 3e78ecead297
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
