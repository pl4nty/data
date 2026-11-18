-- Threat: !InfrastructureShared
-- Name: 43781c3e121e
-- Type: 21

if not peattributes.isvbnative and not peattributes.isvbpcode then
  return mp.CLEAN
end
if hstrlog[1].matched then
  local l_0_0 = hstrlog[1].VA
  mp.readprotection(false)
  local l_0_1 = pe.mmap_va(l_0_0 + 62, 4)
  local l_0_2 = string.byte(l_0_1, 1)
  local l_0_3 = string.byte(l_0_1, 2)
  local l_0_4 = string.byte(l_0_1, 3)
  local l_0_5 = string.byte(l_0_1, 4)
  if l_0_2 == l_0_5 and l_0_3 == l_0_4 then
    return mp.INFECTED
  end
end
return mp.CLEAN
