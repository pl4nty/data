-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFirstFolderAttributeA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_parent_filehandle)()
if not (mp.is_handle_nil)(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = normalize_path((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_1 == nil or #l_0_1 <= 1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (string.gsub)(l_0_1, "\\", "")
if l_0_3 == nil or l_0_3 == 0 then
  return mp.CLEAN
end
local l_0_4 = "Lua:FirstFolder"
local l_0_5 = (string.format)("%sCount!%s", l_0_4, tostring(l_0_3))
;
(mp.set_mpattribute)(l_0_5)
l_0_1 = l_0_1:gsub("%s", "/x20")
l_0_1 = l_0_1:gsub("%(", "/x28")
l_0_1 = l_0_1:gsub("%)", "/x29")
local l_0_6 = (string.gmatch)(l_0_1, "[^\\]+")
local l_0_7 = 0
for l_0_11 in l_0_6 do
  if #l_0_11 >= 1 and l_0_7 <= 5 then
    local l_0_12 = (string.format)("%s%s!", l_0_4, tostring(l_0_7))
    if l_0_12 ~= nil then
      local l_0_13 = l_0_12 .. l_0_11
      if #l_0_13 <= 63 then
        (mp.set_mpattribute)(l_0_13)
      else
        ;
        (mp.set_mpattribute)(l_0_13:sub(1, 63))
        ;
        (mp.set_mpattribute)(l_0_12 .. ":longfolder")
      end
    end
  end
  do
    do
      l_0_7 = l_0_7 + 1
      if l_0_7 >= 6 then
        break
      end
      -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out DO_STMT

    end
  end
end
return mp.CLEAN

