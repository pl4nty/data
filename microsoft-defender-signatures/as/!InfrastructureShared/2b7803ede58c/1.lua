-- Threat: !InfrastructureShared
-- Name: 2b7803ede58c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
