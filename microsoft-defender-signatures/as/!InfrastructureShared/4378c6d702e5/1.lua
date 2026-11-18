-- Threat: !InfrastructureShared
-- Name: 4378c6d702e5
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
