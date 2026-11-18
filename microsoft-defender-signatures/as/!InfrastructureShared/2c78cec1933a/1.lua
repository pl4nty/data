-- Threat: !InfrastructureShared
-- Name: 2c78cec1933a
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true and mp.getfilesize() > 6700000 then
  return mp.INFECTED
end
return mp.CLEAN
