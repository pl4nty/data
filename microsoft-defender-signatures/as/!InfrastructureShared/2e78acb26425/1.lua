-- Threat: !InfrastructureShared
-- Name: 2e78acb26425
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 14000000 and mp.getfilesize() < 20000000 then
  return mp.INFECTED
end
return mp.CLEAN
