-- Threat: !InfrastructureShared
-- Name: 3c78bbaa76c8
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.getfilesize() < 160000 then
  return mp.INFECTED
end
return mp.CLEAN
