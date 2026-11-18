-- Threat: !InfrastructureShared
-- Name: !#Lua:FileNametoOriginalNameMismatch
-- Type: 10
-- MpAttributes: pea_isdll & pea_hasexports & Lua:TopLevelUnsigned

local l_0_0 = string.sub(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)), 0, -5)
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = {
  [".bin"] = true,
  [".cpl"] = true,
  [".dat"] = true,
  [".db"] = true
}
if l_0_1[l_0_0:sub(-3)] == true or l_0_1[l_0_0:sub(-4)] == true then
  return mp.CLEAN
end
local l_0_2 = pe.get_versioninfo()
if l_0_2 == nil or l_0_2.OriginalFilename == nil and l_0_2.InternalName == nil then
  return mp.INFECTED
end
local l_0_3, l_0_4
if l_0_2.OriginalFilename ~= nil then
  l_0_3 = l_0_2.OriginalFilename:lower():match("(.+)%.")
end
if l_0_2.InternalName ~= nil then
  l_0_4 = l_0_2.InternalName:lower():match("(.+)%.")
end
if l_0_3 == nil or l_0_4 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, l_0_3, 1, true) == nil or string.find(l_0_0, l_0_4, 1, true) == nil then
  return mp.INFECTED
end
return mp.CLEAN
