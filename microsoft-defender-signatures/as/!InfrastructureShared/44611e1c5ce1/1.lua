-- Threat: !InfrastructureShared
-- Name: 44611e1c5ce1
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
