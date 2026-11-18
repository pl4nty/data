-- Threat: !InfrastructureShared
-- Name: 2778805f5741
-- Type: 21
-- Flags: 1

if pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size ~= 0 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size ~= 0 then
  return mp.INFECTED
end
return mp.CLEAN
