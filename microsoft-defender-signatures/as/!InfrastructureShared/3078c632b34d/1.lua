-- Threat: !InfrastructureShared
-- Name: 3078c632b34d
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() > 1572864 and mp.getfilesize() < 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
