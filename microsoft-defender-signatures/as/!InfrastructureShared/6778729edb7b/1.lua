-- Threat: !InfrastructureShared
-- Name: 6778729edb7b
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
