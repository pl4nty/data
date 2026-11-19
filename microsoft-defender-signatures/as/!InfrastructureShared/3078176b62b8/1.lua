-- Threat: !InfrastructureShared
-- Name: 3078176b62b8
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
