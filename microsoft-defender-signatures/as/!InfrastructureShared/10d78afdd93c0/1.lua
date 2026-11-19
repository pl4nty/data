-- Threat: !InfrastructureShared
-- Name: 10d78afdd93c0
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
