-- Threat: !InfrastructureShared
-- Name: 9c61ca275f06
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
