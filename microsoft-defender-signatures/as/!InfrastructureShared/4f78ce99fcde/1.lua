-- Threat: !InfrastructureShared
-- Name: 4f78ce99fcde
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 90000 and mp.getfilesize() < 100000 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
