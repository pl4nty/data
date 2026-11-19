-- Threat: !InfrastructureShared
-- Name: 1e54051087f73
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
