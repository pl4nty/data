-- Threat: !InfrastructureShared
-- Name: 7a789765cbad
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
