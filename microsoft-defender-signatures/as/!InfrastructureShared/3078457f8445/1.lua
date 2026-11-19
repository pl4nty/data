-- Threat: !InfrastructureShared
-- Name: 3078457f8445
-- Type: 21

if peattributes.isdll and peattributes.hasexports then
  return mp.INFECTED
end
return mp.CLEAN
