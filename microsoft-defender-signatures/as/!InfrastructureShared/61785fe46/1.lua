-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\61785fe46\1.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 3 and (hstrlog[4]).matched then
  local l_0_0 = (hstrlog[4]).VA + 18
  local l_0_1 = (mp.readu_u32)((pe.mmap_va)(l_0_0, 4), 1)
  local l_0_2 = (pe.mmap_va)(l_0_1, 6)
  if (string.sub)(l_0_2, 1, 5) == "MyApp" then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

