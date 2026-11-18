-- Threat: !InfrastructureShared
-- Name: 37785abed88f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.getfilesize() >= 50000000 then
  return mp.INFECTED
end
return mp.CLEAN
