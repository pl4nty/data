-- Threat: !InfrastructureShared
-- Name: 3a78b10e969c
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
