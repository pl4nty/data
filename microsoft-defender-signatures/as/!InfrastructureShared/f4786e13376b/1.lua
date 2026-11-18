-- Threat: !InfrastructureShared
-- Name: f4786e13376b
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
