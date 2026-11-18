-- Threat: !InfrastructureShared
-- Name: d878d2e7b473
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
