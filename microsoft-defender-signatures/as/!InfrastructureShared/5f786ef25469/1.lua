-- Threat: !InfrastructureShared
-- Name: 5f786ef25469
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
