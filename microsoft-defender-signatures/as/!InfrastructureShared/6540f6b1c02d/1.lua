-- Threat: !InfrastructureShared
-- Name: 6540f6b1c02d
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 5000 then
  return mp.INFECTED
end
return mp.CLEAN
