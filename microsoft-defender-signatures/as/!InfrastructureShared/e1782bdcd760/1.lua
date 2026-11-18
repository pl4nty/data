-- Threat: !InfrastructureShared
-- Name: e1782bdcd760
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
