-- Threat: !InfrastructureShared
-- Name: 467858c87313
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
