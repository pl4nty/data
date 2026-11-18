-- Threat: !InfrastructureShared
-- Name: 1a578d63029c5
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
