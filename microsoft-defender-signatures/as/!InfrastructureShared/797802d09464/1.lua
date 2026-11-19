-- Threat: !InfrastructureShared
-- Name: 797802d09464
-- Type: 21
-- Flags: 1

if hstrlog[1].matched and (hstrlog[1].VA < pehdr.AddressOfEntryPoint or hstrlog[1].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
if hstrlog[2].matched and (hstrlog[2].VA < pehdr.AddressOfEntryPoint or hstrlog[2].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
if hstrlog[3].matched and (hstrlog[3].VA < pehdr.AddressOfEntryPoint or hstrlog[3].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
if hstrlog[4].matched and (hstrlog[4].VA < pehdr.AddressOfEntryPoint or hstrlog[4].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
if hstrlog[5].matched and (hstrlog[5].VA < pehdr.AddressOfEntryPoint or hstrlog[5].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
if hstrlog[6].matched and (hstrlog[6].VA < pehdr.AddressOfEntryPoint or hstrlog[6].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
if hstrlog[7].matched and (hstrlog[7].VA < pehdr.AddressOfEntryPoint or hstrlog[7].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
if hstrlog[8].matched and (hstrlog[8].VA < pehdr.AddressOfEntryPoint or hstrlog[8].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
if hstrlog[9].matched and (hstrlog[9].VA < pehdr.AddressOfEntryPoint or hstrlog[9].VA > pehdr.AddressOfEntryPoint + 80) then
  return mp.CLEAN
end
return mp.LOWFI
