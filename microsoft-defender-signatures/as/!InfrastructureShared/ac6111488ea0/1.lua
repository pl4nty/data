-- Threat: !InfrastructureShared
-- Name: ac6111488ea0
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
