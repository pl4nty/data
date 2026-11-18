-- Threat: !InfrastructureShared
-- Name: 147f295ec0d2
-- Type: 21

if pevars.sigaddr ~= pehdr.ImageBase + pehdr.AddressOfEntryPoint then
  return mp.CLEAN
end
local l_0_0 = mp.crc32(-1, epcode, 17, 17)
if pe.query_import(pe.IMPORT_STATIC, 214667374) and l_0_0 == 3988924912 then
  return mp.INFECTED
end
return mp.CLEAN
