-- Threat: !InfrastructureShared
-- Name: 47783873232f
-- Type: 21

if peattributes.isexe and peattributes.no_security == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
