-- Threat: !InfrastructureShared
-- Name: 7b780c17e1e6
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.hasexports == true and mp.getfilesize() > 800000 and mp.getfilesize() < 950000 then
  return mp.INFECTED
end
return mp.CLEAN
