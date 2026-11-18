-- Threat: !InfrastructureShared
-- Name: 2878b0319490
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
