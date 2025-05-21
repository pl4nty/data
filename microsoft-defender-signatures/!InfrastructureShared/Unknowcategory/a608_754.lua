-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a608_754.luac 

-- params : ...
-- function num : 0
if not peattributes.isdll or not peattributes.hasexports or not (mp.get_mpattribute)("BM_UnsignedDll") or (mp.getfilesize)() > 1048576 then
  return mp.CLEAN
end
if (pe.get_exports_count)() ~= 2 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (pe.get_exports)()
if l_0_1 == nil or l_0_0 ~= 2 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_2, l_0_3 = nil, nil
for l_0_7 = 1, l_0_0 do
  local l_0_8 = (pe.mmap_string_rva)((l_0_1[l_0_7]).namerva, 64)
  if l_0_8 ~= nil and (l_0_8:sub(-1) == "w" or l_0_8:sub(-1) == "W") then
    l_0_2 = l_0_8:lower()
  else
    if l_0_8 ~= nil then
      l_0_3 = l_0_8:lower()
    end
  end
end
do
  if l_0_2 == nil or l_0_3 == nil then
    return mp.CLEAN
  end
  if l_0_2 == l_0_3 .. "w" then
    return mp.INFECTED
  end
  return mp.CLEAN
end

