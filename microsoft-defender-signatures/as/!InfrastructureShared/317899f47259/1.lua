-- Threat: !InfrastructureShared
-- Name: 317899f47259
-- Type: 21

local l_0_0 = {
  81,
  87,
  69,
  82,
  84,
  89,
  65,
  83,
  68,
  70,
  74,
  75,
  71,
  72
}
local l_0_1 = hstrlog[1].VA
local l_0_2 = hstrlog[2].VA
local l_0_3 = pe.mmap_va(l_0_1 + 4, 1)
local l_0_4 = pe.mmap_va(l_0_2 + 4, 1)
local l_0_5 = string.byte(l_0_3, 1)
local l_0_6 = string.byte(l_0_4, 1)
local l_0_7 = 0
local l_0_8 = 0
if hstrlog[4].matched then
  l_0_7 = 7
  l_0_8 = hstrlog[4].VA
else
  l_0_7 = 8
  l_0_8 = hstrlog[5].VA
end
for l_0_9 = 1, #l_0_0, 2 do
  if l_0_5 == l_0_0[l_0_9] and l_0_6 == l_0_0[l_0_9 + 1] then
    local l_0_10 = string.format("obf_oa_00A_data_%02x%02x_%02x_%08x_%08x_", l_0_6, l_0_5, l_0_7, hstrlog[3].VA, l_0_8)
    mp.set_mpattribute(l_0_10)
    return mp.INFECTED
  end
end
return mp.CLEAN
