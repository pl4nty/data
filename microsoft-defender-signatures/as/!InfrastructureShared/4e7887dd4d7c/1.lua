-- Threat: !InfrastructureShared
-- Name: 4e7887dd4d7c
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
