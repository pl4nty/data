-- Threat: !InfrastructureShared
-- Name: 7778cf8537c6
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
