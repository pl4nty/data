-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\8640_298.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (pe.get_exports)()
for l_0_5 = 1, l_0_0 do
  if (pe.mmap_string_rva)((l_0_1[l_0_5]).namerva, 64) == "cJSON_ReplaceItemInObjectCaseSensitive" then
    return mp.INFECTED
  end
end
return mp.CLEAN

