-- Threat: !InfrastructureShared
-- Name: 2978e48be3a6
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 970000 then
  return mp.INFECTED
end
return mp.CLEAN
