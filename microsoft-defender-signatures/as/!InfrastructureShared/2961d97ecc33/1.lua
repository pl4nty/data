-- Threat: !InfrastructureShared
-- Name: 2961d97ecc33
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 42498 then
  return mp.INFECTED
end
return mp.CLEAN
