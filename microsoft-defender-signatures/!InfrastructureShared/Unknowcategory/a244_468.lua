-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a244_468.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("pea_isdll") and (mp.getfilesize)() < 153600 then
  local l_0_0, l_0_1 = (pe.get_exports)()
  if l_0_1 == nil or l_0_0 == 0 then
    return mp.CLEAN
  end
  for l_0_5 = 1, l_0_0 do
    local l_0_6 = (pe.mmap_string_rva)((l_0_1[l_0_5]).namerva, 64)
    if l_0_6 ~= nil and (string.lower)(l_0_6) == "dllgetclassobject" then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

