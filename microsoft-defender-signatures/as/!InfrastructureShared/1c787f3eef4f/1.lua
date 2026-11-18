-- Threat: !InfrastructureShared
-- Name: 1c787f3eef4f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
