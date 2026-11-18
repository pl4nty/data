-- Threat: !InfrastructureShared
-- Name: 7f789492c60b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 48000 then
  return mp.INFECTED
end
return mp.CLEAN
