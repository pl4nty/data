-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\28178bf80151d\1.luac 

-- params : ...
-- function num : 0
do
  if candidatePeFile() and (hstrlog[3]).matched and (hstrlog[3]).VA ~= -1 then
    local l_0_0 = (pe.mmap_va)((hstrlog[3]).VA, 30)
    if (string.find)(l_0_0, "H��", 1, true) == nil then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

