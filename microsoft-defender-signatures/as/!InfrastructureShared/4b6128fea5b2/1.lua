-- Threat: !InfrastructureShared
-- Name: 4b6128fea5b2
-- Type: 21

if peattributes.no_security == true and peattributes.isdll and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
