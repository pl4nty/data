-- Threat: !InfrastructureShared
-- Name: 9878e7b6daf8
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
