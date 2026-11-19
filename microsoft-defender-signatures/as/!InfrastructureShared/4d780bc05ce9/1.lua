-- Threat: !InfrastructureShared
-- Name: 4d780bc05ce9
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
