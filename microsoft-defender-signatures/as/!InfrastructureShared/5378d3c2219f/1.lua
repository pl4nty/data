-- Threat: !InfrastructureShared
-- Name: 5378d3c2219f
-- Type: 21

if peattributes.isvbnative == true then
  local l_0_0 = hstrlog[2].VA
  local l_0_1 = pe.mmap_va(l_0_0 + 7, 4)
  local l_0_2 = 0
  for l_0_3 = 4, 1, -1 do
    l_0_2 = l_0_2 * 256 + string.byte(l_0_1, l_0_3)
  end
  if 8192 < l_0_2 then
    return mp.INFECTED
  end
end
return mp.LOWFI
