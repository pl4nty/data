-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a4da_604.luac 

-- params : ...
-- function num : 0
if peattributes.isdll and (mp.get_mpattribute)("BM_UnsignedDll") and (mp.getfilesize)() < 512000 then
  local l_0_0, l_0_1 = (pe.get_exports)()
  if l_0_1 == nil or l_0_0 == 0 then
    return mp.CLEAN
  end
  local l_0_2 = {}
  l_0_2.npgetcaps = true
  l_0_2.nplogonnotify = true
  l_0_2.nppasswordchangenotify = true
  local l_0_3 = 0
  for l_0_7 = 1, l_0_0 do
    local l_0_8 = (pe.mmap_string_rva)((l_0_1[l_0_7]).namerva, 64)
    if l_0_8 ~= nil and l_0_2[(string.lower)(l_0_8)] then
      l_0_3 = l_0_3 + 1
    end
    if l_0_3 == 3 then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

