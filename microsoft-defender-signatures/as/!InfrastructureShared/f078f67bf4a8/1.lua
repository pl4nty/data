-- Threat: !InfrastructureShared
-- Name: f078f67bf4a8
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
