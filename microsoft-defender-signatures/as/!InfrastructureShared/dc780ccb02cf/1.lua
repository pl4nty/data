-- Threat: !InfrastructureShared
-- Name: dc780ccb02cf
-- Type: 21

if peattributes.hasexports == true and peattributes.isdll == false and mp.getfilesize() == 38577121 then
  return mp.INFECTED
end
return mp.CLEAN
