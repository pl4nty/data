-- Threat: !InfrastructureShared
-- Name: 6b7824875714
-- Type: 21

local l_0_0 = pehdr.ImageBase + pehdr.AddressOfEntryPoint
if hstrlog[1].VA == l_0_0 or hstrlog[2].VA == l_0_0 or hstrlog[3].VA == l_0_0 or hstrlog[4].VA == l_0_0 or hstrlog[5].VA == l_0_0 or hstrlog[6].VA == l_0_0 or hstrlog[7].VA == l_0_0 or hstrlog[8].VA == l_0_0 + 7 or hstrlog[9].VA == l_0_0 + 7 or hstrlog[10].VA == l_0_0 + 12 or hstrlog[11].VA == l_0_0 + 2 then
  return mp.INFECTED
end
return mp.CLEAN
