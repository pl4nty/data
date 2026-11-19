-- Threat: !InfrastructureShared
-- Name: 3378d368879f
-- Type: 21

local l_0_0 = hstrlog[1].VA
local l_0_1 = pe.mmap_va(l_0_0 + 8, 4)
local l_0_2 = string.byte(l_0_1, 1) + string.byte(l_0_1, 2) * 256 + string.byte(l_0_1, 3) * 65536
if l_0_2 < 1048575 then
  mp.readprotection(false)
  local l_0_3 = pe.mmap_va(l_0_0, l_0_2)
  mp.vfo_add_buffer(l_0_3, "[Cabinet]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
