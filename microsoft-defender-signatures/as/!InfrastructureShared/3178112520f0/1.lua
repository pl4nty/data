-- Threat: !InfrastructureShared
-- Name: 3178112520f0
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
