-- Threat: !InfrastructureShared
-- Name: 7b785f296b6c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.getfilesize() <= 200000 then
  return mp.INFECTED
end
return mp.CLEAN
