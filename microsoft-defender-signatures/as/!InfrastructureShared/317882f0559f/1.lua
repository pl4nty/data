-- Threat: !InfrastructureShared
-- Name: 317882f0559f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
