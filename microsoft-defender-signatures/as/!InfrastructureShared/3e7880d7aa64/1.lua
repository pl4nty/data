-- Threat: !InfrastructureShared
-- Name: 3e7880d7aa64
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 53167 then
  return mp.INFECTED
end
return mp.CLEAN
