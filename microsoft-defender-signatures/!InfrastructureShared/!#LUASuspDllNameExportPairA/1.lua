-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUASuspDllNameExportPairA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1, l_0_2 = (pe.get_exports)()
if l_0_0 ~= nil and l_0_1 > 2 and l_0_1 < 15 then
  l_0_0 = (string.sub)(l_0_0, 1, -5)
  for l_0_6 = 1, l_0_1 do
    local l_0_7 = (pe.mmap_string_rva)((l_0_2[l_0_6]).namerva, 64)
    if l_0_7 ~= nil and (string.lower)(l_0_7) == l_0_0 then
      (mp.set_mpattribute)("do_exhaustivehstr_64bit_rescan")
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

