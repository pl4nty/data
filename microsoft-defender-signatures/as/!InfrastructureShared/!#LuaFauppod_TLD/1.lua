-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaFauppod_TLD\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  l_1_1[".monster"] = true
  l_1_1[".boats"] = true
  l_1_1[".yachts"] = true
  l_1_1[".christmas"] = true
  l_1_1[".lat"] = true
  l_1_1[".icu"] = true
  l_1_1[".mom"] = true
  l_1_1[".beauty"] = true
  l_1_1[".pics"] = true
  l_1_1[".autos"] = true
  l_1_1[".rest"] = true
  l_1_1[".motorcycles"] = true
  l_1_1[".makeup"] = true
  l_1_1[".hair"] = true
  l_1_1[".cyou"] = true
  l_1_1[".buzz"] = true
  l_1_1[".bond"] = true
  l_1_1[".homes"] = true
  l_1_1[".skin"] = true
  if l_1_1[l_1_0] then
    return true
  end
  return false
end

local l_0_1 = (mp.IOAVGetDownloadUrl)()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if l_0_1 == "about:internet" then
  return mp.CLEAN
end
if not StringEndsWith(l_0_1, "/") then
  return mp.CLEAN
end
if not StringStartsWith(l_0_1, "https") then
  return mp.CLEAN
end
local l_0_2 = ExtractPartsFromUri(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2.host == "" or l_0_2.host == nil then
  return mp.CLEAN
end
local l_0_3 = split(l_0_2.host, "%.")
do
  if l_0_3 and #l_0_3 == 3 and (string.len)(l_0_3[1]) == 8 then
    local l_0_4 = "." .. tostring(l_0_3[#l_0_3])
    if l_0_4 and l_0_0(l_0_4) then
      (mp.set_mpattribute)("//Fauppod_TLD")
    end
  end
  return mp.CLEAN
end

