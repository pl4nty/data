-- Threat: !InfrastructureShared
-- Name: 1e78efc38c45
-- Type: 21
-- Flags: 1

if pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size == 0 or pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size == 0 then
  return mp.INFECTED
end
return mp.CLEAN
