-- Threat: !InfrastructureShared
-- Name: 327823f4510e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
