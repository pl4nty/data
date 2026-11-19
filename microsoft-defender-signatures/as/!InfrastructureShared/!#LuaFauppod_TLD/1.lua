-- Threat: !InfrastructureShared
-- Name: !#Lua:Fauppod_TLD
-- Type: 13
-- Includes: TechniqueTracker, LuaFuncHelper
-- MpAttributes: RPF:AnyFileHasIOAVURL & BM_ARCHIVE_FILE_GROUP

local function l_0_0(l_1_0)
  local l_1_1 = {
    [".monster"] = true,
    
    [".boats"] = true,
    [".yachts"] = true,
    [".christmas"] = true,
    [".lat"] = true,
    [".icu"] = true,
    [".mom"] = true,
    [".beauty"] = true,
    [".pics"] = true,
    [".autos"] = true,
    [".rest"] = true,
    [".motorcycles"] = true,
    [".makeup"] = true,
    [".hair"] = true,
    [".cyou"] = true,
    [".buzz"] = true,
    [".bond"] = true,
    [".homes"] = true,
    [".skin"] = true
  }
  if l_1_1[l_1_0] then
    return true
  end
  return false
end

local l_0_1 = mp.IOAVGetDownloadUrl()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
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
if l_0_3 and #l_0_3 == 3 and string.len(l_0_3[1]) == 8 then
  local l_0_4 = "." .. tostring(l_0_3[#l_0_3])
  if l_0_4 and l_0_0(l_0_4) then
    mp.set_mpattribute("//Fauppod_TLD")
  end
end
return mp.CLEAN
