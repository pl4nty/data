-- Threat: !InfrastructureShared
-- Name: 15540070d98c1
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
