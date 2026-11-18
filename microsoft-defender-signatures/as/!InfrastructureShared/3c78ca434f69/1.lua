-- Threat: !InfrastructureShared
-- Name: 3c78ca434f69
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 348162 then
  return mp.INFECTED
end
return mp.CLEAN
