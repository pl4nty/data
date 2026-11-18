-- Threat: !InfrastructureShared
-- Name: 5878d566fa83
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
