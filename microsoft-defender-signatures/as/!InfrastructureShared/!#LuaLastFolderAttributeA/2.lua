-- Threat: !InfrastructureShared
-- Name: !#Lua:LastFolderAttribute.A
-- Type: 12
-- Includes: Path
-- MpAttributes: !MpIsAMSIScan

local l_0_0 = mp.get_parent_filehandle()
if not mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 <= 1 then
  return mp.CLEAN
end
l_0_1 = normalize_path(l_0_1)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.gsub(l_0_1, "\\", "")
if l_0_3 == nil or 18 <= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = "Lua:LastFolder"
local l_0_5 = string.format("%sCount!%s", l_0_4, tostring(l_0_3))
if l_0_3 == 0 and #l_0_1 == 2 and string.sub(l_0_1, -1) == ":" then
  mp.set_mpattribute(l_0_4 .. "0!" .. l_0_1)
  mp.set_mpattribute(l_0_5)
  return mp.CLEAN
end
l_0_1 = l_0_1:gsub("%s", "/x20")
l_0_1 = l_0_1:gsub("%(", "/x28")
l_0_1 = l_0_1:gsub("%)", "/x29")
local l_0_6 = string.gmatch(l_0_1, "[^\\]+")
local l_0_7 = false
for l_0_8 in l_0_6, nil, nil do
  if 0 <= l_0_3 and l_0_3 <= 5 and 1 <= #l_0_8 then
    local l_0_9 = string.format("%s%s!", l_0_4, tostring(l_0_3))
    if l_0_9 ~= nil then
      l_0_7 = true
      local l_0_10 = l_0_9 .. l_0_8
      if #l_0_10 <= 63 then
        mp.set_mpattribute(l_0_10)
      else
        mp.set_mpattribute(l_0_10:sub(1, 63))
        mp.set_mpattribute(l_0_9 .. ":longfolder")
      end
    end
    if 1 < #l_0_8 and l_0_8:sub(-1) == "." then
      local l_0_11 = "Lua:FilePathVulnerableToMagicDot"
      mp.set_mpattribute(l_0_11)
      local l_0_12 = string.format("%s!LastFolder%s", l_0_11, tostring(l_0_3))
      mp.set_mpattribute(l_0_12)
    end
  end
  l_0_3 = l_0_3 - 1
  if l_0_3 < 0 then
    break
  end
end
if l_0_7 == true then
  mp.set_mpattribute(l_0_5)
end
return mp.CLEAN
