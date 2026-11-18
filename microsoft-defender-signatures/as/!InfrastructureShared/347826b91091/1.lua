-- Threat: !InfrastructureShared
-- Name: 347826b91091
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
