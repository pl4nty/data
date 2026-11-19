-- Threat: !InfrastructureShared
-- Name: 854024cf9b8f
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
