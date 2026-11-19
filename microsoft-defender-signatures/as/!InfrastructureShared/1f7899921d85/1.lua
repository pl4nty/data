-- Threat: !InfrastructureShared
-- Name: 1f7899921d85
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 93698 then
  return mp.INFECTED
end
return mp.CLEAN
