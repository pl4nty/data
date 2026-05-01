-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFileNameAttributeA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_parent_filehandle)()
if not (mp.is_handle_nil)(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 > 47 then
  return mp.CLEAN
end
if (string.find)(l_0_1, " ", 1, true) ~= nil then
  l_0_1 = l_0_1:gsub("%s", "/x20")
  if l_0_1 == nil or #l_0_1 > 47 then
    return mp.CLEAN
  end
end
local l_0_2 = "Lua:FnameAttr!"
;
(mp.set_mpattribute)(l_0_2 .. l_0_1)
local l_0_3 = nil
if (string.sub)(l_0_1, #l_0_1 - 3, #l_0_1 - 3) == "." then
  l_0_3 = (string.sub)(l_0_1, -3)
else
  if (string.sub)(l_0_1, #l_0_1 - 4, #l_0_1 - 4) == "." then
    l_0_3 = (string.sub)(l_0_1, -4)
  else
    if (string.sub)(l_0_1, #l_0_1 - 2, #l_0_1 - 2) == "." then
      l_0_3 = (string.sub)(l_0_1, -2)
    end
  end
end
if l_0_3 ~= nil and #l_0_3 > 1 then
  local l_0_4 = "Lua:FileExtensionAttr!" .. l_0_3
  ;
  (mp.set_mpattribute)(l_0_4)
  local l_0_5 = (string.sub)(l_0_1, 1, #l_0_1 - (#l_0_3 + 1))
  local l_0_6 = "Lua:FnameNoExAttr!" .. l_0_5
  ;
  (mp.set_mpattribute)(l_0_6)
end
do
  return mp.CLEAN
end

