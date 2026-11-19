-- Threat: !InfrastructureShared
-- Name: 7361e4207e1e
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
