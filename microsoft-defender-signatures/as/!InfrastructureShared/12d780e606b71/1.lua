-- Threat: !InfrastructureShared
-- Name: 12d780e606b71
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() == 668672 then
  return mp.INFECTED
end
return mp.CLEAN
