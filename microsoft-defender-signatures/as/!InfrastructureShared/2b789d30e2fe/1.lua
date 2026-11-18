-- Threat: !InfrastructureShared
-- Name: 2b789d30e2fe
-- Type: 21

local l_0_0 = hstrlog[1].VA
local l_0_1 = pehdr.ImageBase
local l_0_2 = pesecs[1].VirtualAddress + l_0_1 + 4096
if l_0_0 < l_0_2 or l_0_0 > l_0_1 + 28672 then
  return mp.CLEAN
end
local l_0_3 = pe.VM_SEARCH_BM
local l_0_4 = pe.vm_search
if l_0_4(l_0_2, l_0_0, "\137\140\133\144\001\003\255\233\144\001\002\255\255\139\133\144\000", nil, l_0_3) ~= 4294967295 then
  return mp.INFECTED
end
if l_0_4(l_0_2, l_0_0, "\137L\133\144\001\001\233\144\001\002\255\255\139E\144\000", nil, l_0_3) ~= 4294967295 then
  return mp.INFECTED
end
return mp.CLEAN
