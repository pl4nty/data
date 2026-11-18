-- Threat: !InfrastructureShared
-- Name: 3a787ca619b7
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 102400 then
  return mp.INFECTED
end
return mp.CLEAN
