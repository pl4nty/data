-- Threat: !InfrastructureShared
-- Name: 6b780b93d8ee
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
