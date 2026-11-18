-- Threat: !InfrastructureShared
-- Name: 145404dd10fb6
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
