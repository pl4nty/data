-- Threat: !InfrastructureShared
-- Name: 4978dadb5faf
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
