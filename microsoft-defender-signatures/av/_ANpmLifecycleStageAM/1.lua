-- Threat: \xadANpmLifecycleStage.AM
-- Type: 24
-- Includes: BMLuaLib, ResearchData
-- MpAttributes: Lua:NodeEncodedStage.AM

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if isnull(l_0_0) or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
if string.find(l_0_0, "->", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(MpCommon.PathToWin32Path, l_0_0)
if not l_0_1 or isnull(l_0_2) or type(l_0_2) ~= "string" then
  set_research_data("SC_NpmLifecycle_Error", "LocalPathUnavailable", false)
  return mp.CLEAN
end
l_0_2 = string.gsub(string.lower(l_0_2), "\\", "/")
if isnull(string.match(l_0_2, "^%a:/")) then
  return mp.CLEAN
end
if not string.find(l_0_2, "/node_modules/", 1, true) then
  return mp.CLEAN
end

local function l_0_3(l_1_0, l_1_1)
  if isnull(l_1_0) or type(l_1_0) ~= "string" or 8192 < #l_1_0 then
    return false
  end
  local l_1_2, l_1_3 = pcall(MpCommon.CommandLineToArgv, l_1_0)
  if not l_1_2 or isnull(l_1_3) or type(l_1_3) ~= "table" or 128 < #l_1_3 then
    set_research_data("SC_NpmLifecycle_Error", "ArgumentParseFailed", false)
    return false
  end
  for l_1_4, l_1_5 in ipairs(l_1_3) do
    if type(l_1_5) ~= "string" then
      set_research_data("SC_NpmLifecycle_Error", "InvalidArgumentType", false)
      return false
    end
  end
  for l_1_6, l_1_7 in ipairs(l_1_3) do
    local l_1_8 = l_1_3[l_1_6 - 1]
    if l_1_6 == 1 or l_1_8 == "&&" or l_1_8 == "||" or l_1_8 == ";" then
      local l_1_9 = string.gsub(string.lower(l_1_7), "\\", "/")
      l_1_9 = string.match(l_1_9, "([^/]+)$")
      if l_1_9 == "node" or l_1_9 == "node.exe" then
        local l_1_10 = l_1_6 + 1
        while l_1_3[l_1_10] == "--no-warnings" or l_1_3[l_1_10] == "--enable-source-maps" do
          l_1_10 = l_1_10 + 1
        end
        if l_1_3[l_1_10] == "--" then
          l_1_10 = l_1_10 + 1
        end
        local l_1_11 = l_1_3[l_1_10]
        if not isnull(l_1_11) then
          l_1_11 = string.gsub(string.lower(l_1_11), "\\", "/")
          if string.sub(l_1_11, 1, 1) ~= "/" and not string.find(l_1_11, ":", 1, true) then
            local l_1_12 = {}
            local l_1_13 = true
            for l_1_14 in string.gmatch(l_1_11, "[^/]+") do
              if l_1_14 == ".." then
                if isnull(l_1_12) then
                  l_1_13 = false
                else
                  table.remove(l_1_12)
                end
              elseif l_1_14 ~= "." then
                l_1_12[#l_1_12 + 1] = l_1_14
              end
            end
            if l_1_13 and table.concat(l_1_12, "/") == l_1_1 then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

local l_0_4 = string.match(l_0_2, "^(.*)/[^/]+$")
local l_0_5 = false
local l_0_6 = false
local l_0_7 = 0
while not isnull(l_0_4) and not l_0_6 and l_0_7 < 8 and string.find(l_0_4, "/node_modules/", 1, true) do
  l_0_7 = l_0_7 + 1
  local l_0_8 = string.gsub(l_0_4 .. "/package.json", "/", "\\")
  local l_0_9, l_0_10 = pcall(sysio.IsFileExists, l_0_8)
  if not l_0_9 or type(l_0_10) ~= "boolean" then
    set_research_data("SC_NpmLifecycle_Error", "ManifestLookupFailed", false)
    return mp.CLEAN
  end
  if l_0_10 then
    do
      l_0_6 = true
      local l_0_11, l_0_12 = pcall(sysio.GetFileSize, l_0_8)
      if not l_0_11 or isnull(l_0_12) or type(l_0_12) ~= "number" or l_0_12 ~= l_0_12 or l_0_12 < 2 or 65536 < l_0_12 then
        set_research_data("SC_NpmLifecycle_Error", "ManifestSizeUnavailableOrOversize", false)
        return mp.CLEAN
      end
      local l_0_13, l_0_14 = pcall(sysio.ReadFile, l_0_8, 0, l_0_12)
      if not l_0_13 or isnull(l_0_14) or type(l_0_14) ~= "string" or #l_0_14 ~= l_0_12 then
        set_research_data("SC_NpmLifecycle_Error", "IncompleteManifestRead", false)
        return mp.CLEAN
      end
      local l_0_15, l_0_16 = pcall(MpCommon.JsonDeserialize, l_0_14)
      if not l_0_15 or type(l_0_16) ~= "table" then
        set_research_data("SC_NpmLifecycle_Error", "InvalidManifestObject", false)
        return mp.CLEAN
      end
      if isnull(l_0_16) then
        return mp.CLEAN
      end
      local l_0_17 = l_0_16.scripts
      if isnull(l_0_17) or type(l_0_17) ~= "table" then
        return mp.CLEAN
      end
      local l_0_18 = string.sub(l_0_2, #l_0_4 + 2)
      local l_0_19 = {
        "preinstall",
        "install",
        "postinstall",
        "prepare"
      }
      for l_0_20, l_0_21 in ipairs(l_0_19) do
        if l_0_3(l_0_17[l_0_21], l_0_18) then
          l_0_5 = true
        end
      end
    end
  else
    l_0_4 = string.match(l_0_4, "^(.*)/[^/]+$")
  end
end
if not l_0_5 then
  return mp.CLEAN
end
set_research_data("SC_NpmLifecycle", "EncodedStageIsLifecycleEntry", false)
mp.set_mpattribute("Lua:NpmLifecycleStage.AM")
return mp.INFECTED
