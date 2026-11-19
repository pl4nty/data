-- Threat: !InfrastructureShared
-- Name: 4b78b07c5ddc
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
