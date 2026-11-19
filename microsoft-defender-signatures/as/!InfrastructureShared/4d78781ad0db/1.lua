-- Threat: !InfrastructureShared
-- Name: 4d78781ad0db
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
