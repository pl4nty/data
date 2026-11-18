-- Threat: !InfrastructureShared
-- Name: 8f78cd4a211c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
