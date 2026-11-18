-- Threat: !InfrastructureShared
-- Name: 4e78290dde32
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
