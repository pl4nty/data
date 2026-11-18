-- Threat: !InfrastructureShared
-- Name: 7e787a011a34
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 155000 and mp.getfilesize() < 200000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
