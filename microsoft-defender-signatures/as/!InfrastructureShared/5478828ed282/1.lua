-- Threat: !InfrastructureShared
-- Name: 5478828ed282
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
