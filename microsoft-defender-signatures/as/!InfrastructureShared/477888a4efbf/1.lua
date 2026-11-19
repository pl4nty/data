-- Threat: !InfrastructureShared
-- Name: 477888a4efbf
-- Type: 21

local l_0_0 = {
  82,
  89,
  79,
  67,
  85,
  73,
  79,
  80,
  81,
  87
}
local l_0_1 = hstrlog[1].VA
local l_0_2 = hstrlog[2].VA
local l_0_3 = pe.mmap_va(l_0_1 + 4, 1)
local l_0_4 = pe.mmap_va(l_0_2 + 4, 1)
local l_0_5 = string.byte(l_0_3, 1)
local l_0_6 = string.byte(l_0_4, 1)
for l_0_7 = 1, #l_0_0, 2 do
  if l_0_5 == l_0_0[l_0_7] and l_0_6 == l_0_0[l_0_7 + 1] then
    local l_0_8 = string.format("obf_oa_marker_%x%x", l_0_6, l_0_5)
    mp.set_mpattribute(l_0_8)
    return mp.INFECTED
  end
end
return mp.CLEAN
