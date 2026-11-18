-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:JS/FakeUpdate.SNC
-- Type: 13
-- Includes: TechniqueTracker, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & RPF:AnyFileHasIOAVURL & (BM_ARCHIVE_FILE_GROUP | BM_CAB_FILE | BM_CONTAINER_FILE | BM_RAR_FILE | BM_UNKNOWN_FILE)

function isFakeUpdateTLD(l_1_0)
  local l_1_1 = {
    [".monster"] = true,
    
    [".boats"] = true,
    [".yachts"] = true,
    [".christmas"] = true,
    [".lat"] = true,
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

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if not string.find(l_0_0, "\\downloads\\", 1, true) then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".xlsx") then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".xls") then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".xlsm") then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".docx") then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".pptx") then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".pdf") then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".exe") then
  return mp.CLEAN
end
if StringEndsWith(l_0_0, ".mp3") then
  return mp.CLEAN
end
local l_0_1 = mp.IOAVGetDownloadUrl()
if (l_0_1 == "" or l_0_1 == nil) and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_2 = mp.GetMOTWZone()
  local l_0_4 = l_0_2 == 3 or l_0_2 == 4
  if l_0_4 then
    l_0_1 = mp.GetMOTWHostUrl()
  end
end
if l_0_1 == nil or l_0_1 == "" then
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
local l_0_5 = ExtractPartsFromUri(l_0_1)
if next(l_0_5) == nil then
  return mp.CLEAN
end
if l_0_5.host == nil or l_0_5.host == "" or l_0_5.path ~= nil or StringStartsWith(l_0_5.host, "www") or l_0_5.scheme ~= "https" then
  return mp.CLEAN
end
local l_0_6 = split(l_0_5.host, "%.")
if l_0_6 and #l_0_6 == 3 and l_0_6[#l_0_6] then
  local l_0_7 = "." .. tostring(l_0_6[#l_0_6])
  if isFakeUpdateTLD(l_0_7) and string.len(l_0_6[1]) == 8 then
    mp.set_mpattribute("FakeUpdate_TLD")
  elseif isSuspTLD(l_0_7) then
    return mp.INFECTED
  end
end
return mp.CLEAN
