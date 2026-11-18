-- Threat: !InfrastructureShared
-- Name: 17b784f7ef0d5
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and mp.getfilesize() < 972234 then
  return mp.INFECTED
end
return mp.CLEAN
