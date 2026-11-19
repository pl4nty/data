-- Threat: !InfrastructureShared
-- Name: 75787bcdb2bd
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
