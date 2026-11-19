-- Threat: !InfrastructureShared
-- Name: 6978e875497a
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
