-- Threat: !InfrastructureShared
-- Name: 4778c4b0e784
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 114690 then
  return mp.INFECTED
end
return mp.CLEAN
