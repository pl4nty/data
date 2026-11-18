-- Threat: !InfrastructureShared
-- Name: 110785c35c03b
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false then
  return mp.INFECTED
end
return mp.CLEAN
