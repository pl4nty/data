-- Threat: !InfrastructureShared
-- Name: 4f784759fe5f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() > 2097152 and mp.getfilesize() < 3145728 then
  return mp.INFECTED
end
return mp.CLEAN
