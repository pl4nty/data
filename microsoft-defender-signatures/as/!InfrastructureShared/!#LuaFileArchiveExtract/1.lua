-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFileArchiveExtract\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_parent_filehandle)()
if not (mp.is_handle_nil)(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 <= 5 then
  return mp.CLEAN
end
local l_0_2 = false
if StringEndsWith(l_0_1, ".zip") and ((string.find)(l_0_1, "\\appdata\\local\\temp\\temp", 1, true) or (string.match)(l_0_1, "\\temp%d+_[%x]+%.zip$")) then
  l_0_2 = true
  ;
  (mp.set_mpattribute)("Lua:FileArchiveExtractionContext.A!explorer")
end
if (string.find)(l_0_1, "\\7z", 1, true) and ((string.find)(l_0_1, "\\appdata\\local\\temp\\7z", 1, true) or (string.match)(l_0_1, "\\temp\\7z[%x]+$")) then
  l_0_2 = true
  ;
  (mp.set_mpattribute)("Lua:FileArchiveExtractionContext.A!7zip")
end
if (string.find)(l_0_1, "\\rar$", 1, true) and ((string.find)(l_0_1, "\\appdata\\local\\temp\\rar$", 1, true) or (string.match)(l_0_1, "\\rar%$.*%.rartemp$")) then
  l_0_2 = true
  ;
  (mp.set_mpattribute)("Lua:FileArchiveExtractionContext.A!winrar")
end
if (string.find)(l_0_1, "\\appdata\\local\\temp\\winzip", 1, true) then
  l_0_2 = true
  ;
  (mp.set_mpattribute)("Lua:FileArchiveExtractionContext.A!winzip")
end
if l_0_2 == true then
  return mp.INFECTED
end
return mp.CLEAN

