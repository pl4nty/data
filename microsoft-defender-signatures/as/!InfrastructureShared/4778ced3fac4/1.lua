-- Threat: !InfrastructureShared
-- Name: 4778ced3fac4
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
