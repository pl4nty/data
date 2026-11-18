-- Threat: !InfrastructureShared
-- Name: 39786179614c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 100000 then
  return mp.INFECTED
end
return mp.CLEAN
