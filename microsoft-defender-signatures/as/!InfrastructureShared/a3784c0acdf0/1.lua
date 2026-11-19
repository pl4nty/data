-- Threat: !InfrastructureShared
-- Name: a3784c0acdf0
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 5600000 and mp.getfilesize() < 8350000 then
  return mp.INFECTED
end
return mp.CLEAN
