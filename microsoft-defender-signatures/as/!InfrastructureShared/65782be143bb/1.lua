-- Threat: !InfrastructureShared
-- Name: 65782be143bb
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
