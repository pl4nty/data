-- Threat: !InfrastructureShared
-- Name: 4178aa9e0470
-- Type: 21

if hstrlog[1].matched then
  local l_0_0 = hstrlog[1].VA
  if l_0_0 == 4194905 and pehdr.AddressOfEntryPoint == 4112 and pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_IMPORT].RVA == 4240 then
    return mp.INFECTED
  end
end
return mp.CLEAN
