-- Threat: !InfrastructureShared
-- Name: cb7880c62231
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() == 73728 then
  return mp.INFECTED
end
return mp.CLEAN
