-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFirstFolderAttributeA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = normalize_path((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil or #l_0_0 <= 1 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (string.gsub)(l_0_0, "\\", "")
if l_0_2 == nil or l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = "Lua:FirstFolder"
local l_0_4 = (string.format)("%sCount!%s", l_0_3, tostring(l_0_2))
;
(mp.set_mpattribute)(l_0_4)
l_0_0 = l_0_0:gsub("%s", "/x20")
local l_0_5 = (string.gmatch)(l_0_0, "[^\\]+")
local l_0_6 = 0
for l_0_10 in l_0_5 do
  if #l_0_10 >= 1 and l_0_6 <= 5 then
    local l_0_11 = (string.format)("%s%s!", l_0_3, tostring(l_0_6))
    if l_0_11 ~= nil then
      local l_0_12 = l_0_11 .. l_0_10
      if #l_0_12 <= 63 then
        (mp.set_mpattribute)(l_0_12)
      else
        ;
        (mp.set_mpattribute)(l_0_12:sub(1, 63))
        ;
        (mp.set_mpattribute)(l_0_11 .. ":longfolder")
      end
    end
  end
  do
    do
      l_0_6 = l_0_6 + 1
      if l_0_6 >= 6 then
        break
      end
      -- DECOMPILER ERROR at PC103: LeaveBlock: unexpected jumping out DO_STMT

    end
  end
end
return mp.CLEAN

