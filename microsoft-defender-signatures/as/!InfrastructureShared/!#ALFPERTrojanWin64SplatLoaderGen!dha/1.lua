-- Threat: !InfrastructureShared
-- Name: !#ALFPER:Trojan:Win64/SplatLoader.Gen!dha
-- Type: 10
-- MpAttributes: pea_hasexports & BM_UnsignedDll & LUA:FileSizeLE1M.B

if mp.get_mpattributesubstring("SplatLoader") then
  return mp.CLEAN
end
local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, ":\\programdata\\usoshared\\", 1, true) == nil then
  return mp.CLEAN
end
if pe.get_exports_count() ~= 2 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pe.get_exports()
if l_0_2 == nil or l_0_1 ~= 2 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3, l_0_4
for l_0_5 = 1, l_0_1 do
  local l_0_6 = pe.mmap_string_rva(l_0_2[l_0_5].namerva, 64)
  if l_0_6 ~= nil and (l_0_6:sub(-1) == "W" or l_0_6:sub(-1) == "w") then
    l_0_3 = l_0_6:lower()
  elseif l_0_6 ~= nil then
    l_0_4 = l_0_6:lower()
  end
end
if l_0_3 == nil or l_0_4 == nil then
  return mp.CLEAN
end
if l_0_3 == l_0_4 .. "w" then
  return mp.INFECTED
end
return mp.CLEAN
