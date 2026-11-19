-- Threat: !InfrastructureShared
-- Name: 477840712e96
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
