-- Threat: !InfrastructureShared
-- Name: 997803096260
-- Type: 21
-- Includes: HstrLuaLib

if candidatePeFile() and hstrlog[1].matched and hstrlog[1].match_offsets_count == 3 then
  local l_0_0 = pe.mmap_va(hstrlog[1].VA, hstrlog[1].match_offsets[2])
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = string.find(l_0_0, "\255\021", 1, true)
  if l_0_1 ~= nil then
    return mp.CLEAN
  end
  local l_0_2 = pe.query_import(pe.IMPORT_STATIC, 2307734577)
  if l_0_2 ~= 0 then
    local l_0_3 = hstrlog[1].VA + hstrlog[1].match_offsets[3]
    local l_0_4 = mp.readu_u32(pe.mmap_va(l_0_3, 4), 1)
    local l_0_5 = l_0_3 + 4 + l_0_4
    if l_0_5 == l_0_2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
