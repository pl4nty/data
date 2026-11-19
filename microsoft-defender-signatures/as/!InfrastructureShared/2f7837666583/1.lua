-- Threat: !InfrastructureShared
-- Name: 2f7837666583
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true and pehdr.AddressOfEntryPoint ~= 837630 then
  return mp.INFECTED
end
return mp.CLEAN
