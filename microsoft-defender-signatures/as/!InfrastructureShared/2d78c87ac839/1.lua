-- Threat: !InfrastructureShared
-- Name: 2d78c87ac839
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 51200 then
  return mp.INFECTED
end
return mp.CLEAN
