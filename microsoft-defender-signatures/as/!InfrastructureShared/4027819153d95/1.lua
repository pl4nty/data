-- Threat: !InfrastructureShared
-- Name: 4027819153d95
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() then
  local l_0_0 = {
    hstrlog[3],
    hstrlog[4],
    hstrlog[5],
    hstrlog[6],
    hstrlog[7],
    hstrlog[8]
  }
  for l_0_1 = 1, #l_0_0 do
    if l_0_0[l_0_1].matched and l_0_0[l_0_1].VA ~= -1 then
      local l_0_2 = pe.mmap_va(l_0_0[l_0_1].VA, 30)
      local l_0_3 = string.find(l_0_2, "\014\000\a\128", 1, true)
      if l_0_3 == nil then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
