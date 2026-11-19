-- Threat: !InfrastructureShared
-- Name: 1b78d56c5c60
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
