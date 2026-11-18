-- Threat: !InfrastructureShared
-- Name: a7782910f896
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
