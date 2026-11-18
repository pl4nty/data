-- Threat: !InfrastructureShared
-- Name: c278750896c8
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
