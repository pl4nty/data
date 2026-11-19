-- Threat: !InfrastructureShared
-- Name: 3b78f0604b30
-- Type: 21

if mp.get_mpattribute("SLF:Win32/Sysdupate.E") then
  return mp.CLEAN
end
local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + hstrlog[1].hitcount
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + hstrlog[2].hitcount
end
if 4 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
