-- Threat: !InfrastructureShared
-- Name: 2478792a5a6d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
