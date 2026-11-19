-- Threat: !InfrastructureShared
-- Name: 8d7801196e4d
-- Type: 21

if not peattributes.hasexports and pehdr.SizeOfImage == 2351104 and pehdr.SizeOfCode == 57344 and pehdr.AddressOfEntryPoint == 14780 then
  return mp.INFECTED
end
return mp.CLEAN
