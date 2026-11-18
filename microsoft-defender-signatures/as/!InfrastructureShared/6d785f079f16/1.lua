-- Threat: !InfrastructureShared
-- Name: 6d785f079f16
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
