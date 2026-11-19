-- Threat: !InfrastructureShared
-- Name: 68782b684d33
-- Type: 21

if peattributes.isdll == true and pehdr.AddressOfEntryPoint == 0 and peattributes.hasexports == true then
  return mp.INFECTED
end
return mp.CLEAN
