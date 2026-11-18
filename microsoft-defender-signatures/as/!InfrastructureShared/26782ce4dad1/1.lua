-- Threat: !InfrastructureShared
-- Name: 26782ce4dad1
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 1578036 then
  return mp.INFECTED
end
return mp.CLEAN
