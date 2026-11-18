-- Threat: !InfrastructureShared
-- Name: 2b7835924c5f
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
