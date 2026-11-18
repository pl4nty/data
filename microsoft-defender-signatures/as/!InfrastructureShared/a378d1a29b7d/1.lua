-- Threat: !InfrastructureShared
-- Name: a378d1a29b7d
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
