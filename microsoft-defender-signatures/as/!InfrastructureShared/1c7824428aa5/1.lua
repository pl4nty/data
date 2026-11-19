-- Threat: !InfrastructureShared
-- Name: 1c7824428aa5
-- Type: 21

if not (peattributes.isdll and peattributes.hasexports and mp.get_mpattribute("BM_UnsignedDll")) or mp.getfilesize() > 1048576 then
  return mp.CLEAN
end
if pe.get_exports_count() ~= 2 then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_1 == nil or l_0_0 ~= 2 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2, l_0_3
for l_0_4 = 1, l_0_0 do
  local l_0_5 = pe.mmap_string_rva(l_0_1[l_0_4].namerva, 64)
  if l_0_5 ~= nil and (l_0_5:sub(-1) == "w" or l_0_5:sub(-1) == "W") then
    l_0_2 = l_0_5:lower()
  elseif l_0_5 ~= nil then
    l_0_3 = l_0_5:lower()
  end
end
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
if l_0_2 == l_0_3 .. "w" then
  return mp.INFECTED
end
return mp.CLEAN
