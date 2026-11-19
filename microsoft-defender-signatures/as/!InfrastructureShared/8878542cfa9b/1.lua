-- Threat: !InfrastructureShared
-- Name: 8878542cfa9b
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() and hstrlog[1].matched and hstrlog[1].match_offsets_count == 4 then
  local l_0_0 = pe.query_import(pe.IMPORT_STATIC, 2307734577)
  if l_0_0 ~= 0 then
    local l_0_1 = hstrlog[1].VA + hstrlog[1].match_offsets[4]
    local l_0_2 = mp.readu_u32(pe.mmap_va(l_0_1, 4), 1)
    local l_0_3 = l_0_1 + 4 + l_0_2
    if l_0_3 == l_0_0 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
