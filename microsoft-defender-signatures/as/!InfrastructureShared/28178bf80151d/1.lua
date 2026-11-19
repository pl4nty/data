-- Threat: !InfrastructureShared
-- Name: 28178bf80151d
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() and hstrlog[3].matched and hstrlog[3].VA ~= -1 then
  local l_0_0 = pe.mmap_va(hstrlog[3].VA, 30)
  local l_0_1 = string.find(l_0_0, "H\133\192", 1, true)
  if l_0_1 == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
