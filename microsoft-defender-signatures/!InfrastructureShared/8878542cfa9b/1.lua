-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8878542cfa9b\1.luac 

-- params : ...
-- function num : 0
if candidatePeFile() and (hstrlog[1]).matched and (hstrlog[1]).match_offsets_count == 4 then
  local l_0_0 = (pe.query_import)(pe.IMPORT_STATIC, 2307734577)
  if l_0_0 ~= 0 then
    local l_0_1 = (hstrlog[1]).VA + ((hstrlog[1]).match_offsets)[4]
    if l_0_1 + 4 + (mp.readu_u32)((pe.mmap_va)(l_0_1, 4), 1) == l_0_0 then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

