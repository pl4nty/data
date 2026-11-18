-- Threat: !InfrastructureShared
-- Name: 3578006ea369
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
