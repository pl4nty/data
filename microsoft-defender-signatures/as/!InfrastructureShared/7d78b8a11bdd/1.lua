-- Threat: !InfrastructureShared
-- Name: 7d78b8a11bdd
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
