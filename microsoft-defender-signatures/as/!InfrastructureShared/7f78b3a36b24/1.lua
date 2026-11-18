-- Threat: !InfrastructureShared
-- Name: 7f78b3a36b24
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
