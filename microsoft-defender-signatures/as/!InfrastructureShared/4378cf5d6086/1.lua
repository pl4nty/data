-- Threat: !InfrastructureShared
-- Name: 4378cf5d6086
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
