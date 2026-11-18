-- Threat: !InfrastructureShared
-- Name: 317888f43ac1
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
