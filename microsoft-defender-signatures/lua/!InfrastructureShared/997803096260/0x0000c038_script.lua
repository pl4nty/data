-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\997803096260\0x0000c038_luac 

-- params : ...
-- function num : 0
if candidatePeFile() and (hstrlog[1]).matched and (hstrlog[1]).match_offsets_count == 3 then
  local l_0_0 = (pe.mmap_va)((hstrlog[1]).VA, ((hstrlog[1]).match_offsets)[2])
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = (string.find)(l_0_0, "\255\021", 1, true)
  if l_0_1 ~= nil then
    return mp.CLEAN
  end
  local l_0_2 = (pe.query_import)(pe.IMPORT_STATIC, 2307734577)
  if l_0_2 ~= 0 then
    local l_0_3 = (hstrlog[1]).VA + ((hstrlog[1]).match_offsets)[3]
    if l_0_3 + 4 + (mp.readu_u32)((pe.mmap_va)(l_0_3, 4), 1) == l_0_2 then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

