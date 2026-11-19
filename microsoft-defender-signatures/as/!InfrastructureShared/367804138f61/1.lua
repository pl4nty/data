-- Threat: !InfrastructureShared
-- Name: 367804138f61
-- Type: 21

if mp.getfilesize() < 54000 and peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
