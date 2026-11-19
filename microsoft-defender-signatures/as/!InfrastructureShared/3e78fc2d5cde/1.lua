-- Threat: !InfrastructureShared
-- Name: 3e78fc2d5cde
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
