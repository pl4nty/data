-- Threat: !InfrastructureShared
-- Name: 4878f67b9fcb
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
