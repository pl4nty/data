-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLastFolderAttributeA\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_parent_filehandle)()
if not (mp.is_handle_nil)(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 <= 1 then
  return mp.CLEAN
end
l_0_1 = normalize_path(l_0_1)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (string.gsub)(l_0_1, "\\", "")
if l_0_3 == nil or l_0_3 >= 18 then
  return mp.CLEAN
end
local l_0_4 = "Lua:LastFolder"
local l_0_5 = (string.format)("%sCount!%s", l_0_4, tostring(l_0_3))
if l_0_3 == 0 and #l_0_1 == 2 and (string.sub)(l_0_1, -1) == ":" then
  (mp.set_mpattribute)(l_0_4 .. "0!" .. l_0_1)
  ;
  (mp.set_mpattribute)(l_0_5)
  return mp.CLEAN
end
l_0_1 = l_0_1:gsub("%s", "/x20")
l_0_1 = l_0_1:gsub("%(", "/x28")
l_0_1 = l_0_1:gsub("%)", "/x29")
local l_0_6 = (string.gmatch)(l_0_1, "[^\\]+")
local l_0_7 = false
for l_0_11 in l_0_6 do
  if l_0_3 >= 0 and l_0_3 <= 5 and #l_0_11 >= 1 then
    local l_0_12 = (string.format)("%s%s!", l_0_4, tostring(l_0_3))
    if l_0_12 ~= nil then
      l_0_7 = true
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
    do
      if #l_0_11 > 1 and l_0_11:sub(-1) == "." then
        local l_0_14 = "Lua:FilePathVulnerableToMagicDot"
        ;
        (mp.set_mpattribute)(l_0_14)
        local l_0_15 = (string.format)("%s!LastFolder%s", l_0_14, tostring(l_0_3))
        ;
        (mp.set_mpattribute)(l_0_15)
      end
      do
        do
          l_0_3 = l_0_3 - 1
          if l_0_3 < 0 then
            break
          end
          -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC182: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
if l_0_7 == true then
  (mp.set_mpattribute)(l_0_5)
end
return mp.CLEAN

