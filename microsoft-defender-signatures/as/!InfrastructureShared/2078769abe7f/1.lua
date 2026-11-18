-- Threat: !InfrastructureShared
-- Name: 2078769abe7f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() > 1048576 and mp.getfilesize() < 3145728 then
  return mp.INFECTED
end
return mp.CLEAN
