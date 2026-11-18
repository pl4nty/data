-- Threat: !InfrastructureShared
-- Name: 31e78e9be18cf
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
