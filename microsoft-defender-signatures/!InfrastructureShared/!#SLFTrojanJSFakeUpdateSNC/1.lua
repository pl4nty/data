-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanJSFakeUpdateSNC\1.luac 

-- params : ...
-- function num : 0
isFakeUpdateTLD = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  l_1_1[".monster"] = true
  l_1_1[".boats"] = true
  l_1_1[".yachts"] = true
  l_1_1[".christmas"] = true
  l_1_1[".lat"] = true
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

local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if not (string.find)(l_0_0, "\\downloads\\", 1, true) then
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
local l_0_1 = (mp.IOAVGetDownloadUrl)()
do
  if (l_0_1 == "" or l_0_1 == nil) and (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
    local l_0_2 = (mp.GetMOTWZone)()
    if l_0_2 == 3 or l_0_2 == 4 then
      l_0_1 = (mp.GetMOTWHostUrl)()
    end
  end
  if l_0_1 == nil or l_0_1 == "" then
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
  local l_0_5 = ExtractPartsFromUri(l_0_1)
  if next(l_0_5) == nil then
    return mp.CLEAN
  end
  if l_0_5.host == nil or l_0_5.host == "" or l_0_5.path ~= nil or StringStartsWith(l_0_5.host, "www") or l_0_5.scheme ~= "https" then
    return mp.CLEAN
  end
  local l_0_6 = split(l_0_5.host, "%.")
  do
    do
      if l_0_6 and #l_0_6 == 3 and l_0_6[#l_0_6] then
        local l_0_7 = "." .. tostring(l_0_6[#l_0_6])
        if isFakeUpdateTLD(l_0_7) and (string.len)(l_0_6[1]) == 8 then
          (mp.set_mpattribute)("FakeUpdate_TLD")
        elseif isSuspTLD(l_0_7) then
          return mp.INFECTED
        end
      end
      do return mp.CLEAN end
      -- DECOMPILER ERROR: 12 unprocessed JMP targets
    end
  end
end

