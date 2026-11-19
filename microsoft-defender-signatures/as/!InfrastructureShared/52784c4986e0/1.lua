-- Threat: !InfrastructureShared
-- Name: 52784c4986e0
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 14000 and mp.getfilesize() < 15500 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
