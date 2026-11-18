-- Threat: !InfrastructureShared
-- Name: d37837f0da32
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
