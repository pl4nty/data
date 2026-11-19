-- Threat: !InfrastructureShared
-- Name: e378c69188be
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
