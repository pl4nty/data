-- Threat: !InfrastructureShared
-- Name: 1254096208014
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
