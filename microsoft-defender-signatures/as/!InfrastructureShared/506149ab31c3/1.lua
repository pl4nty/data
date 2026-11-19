-- Threat: !InfrastructureShared
-- Name: 506149ab31c3
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
