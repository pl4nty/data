-- Threat: !InfrastructureShared
-- Name: 7778cf6e7f79
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
