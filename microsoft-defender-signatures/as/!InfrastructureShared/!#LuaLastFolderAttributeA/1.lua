-- Threat: !InfrastructureShared
-- Name: !#Lua:LastFolderAttribute.A
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
l_0_0 = l_0_0:gsub("\\", "/")
if 1 < #l_0_0 and string.sub(l_0_0, -1) == "/" then
  l_0_0 = string.sub(l_0_0, 1, -2)
end
local l_0_1, l_0_2 = string.gsub(l_0_0, "/", "")
local l_0_3 = l_0_2
if string.sub(l_0_0, 1, 1) == "/" then
  l_0_3 = l_0_3 - 1
end
if l_0_3 < 0 or 18 <= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = "Lua:LastFolder"
local l_0_5 = string.format("%sCount!%s", l_0_4, tostring(l_0_3))
if l_0_3 == 0 and l_0_0 == "/" then
  mp.set_mpattribute(l_0_4 .. "0!/")
  mp.set_mpattribute(l_0_5)
  return mp.CLEAN
end
local l_0_6 = {}
for l_0_7 in string.gmatch(l_0_0, "[^/]+") do
  l_0_7 = l_0_7:gsub("%s", "/x20")
  l_0_7 = l_0_7:gsub("%(", "/x28")
  l_0_7 = l_0_7:gsub("%)", "/x29")
  l_0_6[#l_0_6 + 1] = l_0_7
end
local l_0_8 = false
local l_0_9 = #l_0_6
for l_0_10, l_0_11 in ipairs(l_0_6) do
  local l_0_12 = l_0_9 - l_0_10
  if 0 <= l_0_12 and l_0_12 <= 5 and 1 <= #l_0_11 then
    l_0_8 = true
    local l_0_13 = string.format("%s%s!", l_0_4, tostring(l_0_12))
    local l_0_14 = l_0_13 .. l_0_11
    if #l_0_14 <= 63 then
      mp.set_mpattribute(l_0_14)
    else
      mp.set_mpattribute(l_0_14:sub(1, 63))
      mp.set_mpattribute(l_0_13 .. ":longfolder")
    end
  end
end
if l_0_8 == true then
  mp.set_mpattribute(l_0_5)
end
return mp.CLEAN
