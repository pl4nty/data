-- Threat: !InfrastructureShared
-- Name: 10eb3b9f83ce5
-- Type: 21
-- Includes: BMLuaLib, ResearchData

local function l_0_0(l_1_0)
  if isnull(l_1_0) then
    return {}
  end
  if type(l_1_0) ~= "table" and type(l_1_0) ~= "userdata" then
    set_research_data("SC_RepoPublish_Error", "InvalidEventObject", true)
    return {}
  end
  local l_1_1, l_1_2, l_1_3, l_1_4, l_1_5 = pcall(function()
    if l_1_0.matched ~= true then
      return false
    end
    return true, l_1_0.ppid, l_1_0.timestamp, l_1_0.utf8p2
  end)
  if not l_1_1 then
    set_research_data("SC_RepoPublish_Error", "EventMetadataUnavailable", true)
    return {}
  end
  if not l_1_2 then
    return {}
  end
  if isnull(l_1_3) or type(l_1_3) ~= "string" or type(l_1_4) ~= "number" or l_1_4 <= 0 or l_1_4 - l_1_4 ~= 0 then
    set_research_data("SC_RepoPublish_Error", "EventIdentityOrTimeUnavailable", true)
    return {}
  end
  return {
    ppid = l_1_3,
    timestamp = l_1_4,
    command = l_1_5
  }
end

local l_0_1 = l_0_0(this_sigattrlog[1])
local l_0_2 = l_0_0(this_sigattrlog[2])
local l_0_3 = l_0_0(this_sigattrlog[3])
local l_0_4 = l_0_0(this_sigattrlog[4])
local l_0_5 = l_0_0(this_sigattrlog[5])
if isnull(l_0_1) or isnull(l_0_2) or isnull(l_0_3) or isnull(l_0_4) or isnull(l_0_5) then
  return mp.CLEAN
end
for l_0_6, l_0_7 in ipairs({
  l_0_2,
  l_0_3,
  l_0_4,
  l_0_5
}) do
  if l_0_7.ppid ~= l_0_1.ppid then
    return mp.CLEAN
  end
end
if l_0_1.timestamp > l_0_2.timestamp or l_0_2.timestamp > l_0_3.timestamp or l_0_3.timestamp > l_0_5.timestamp or l_0_4.timestamp < l_0_1.timestamp or l_0_4.timestamp > l_0_5.timestamp or l_0_5.timestamp - l_0_1.timestamp > 6000000000 then
  return mp.CLEAN
end

local function l_0_8(l_3_0)
  if isnull(l_3_0) or type(l_3_0) ~= "string" or 32768 < #l_3_0 then
    set_research_data("SC_RepoPublish_Error", "CommandUnavailableOrOversize", true)
    return {}
  end
  local l_3_1, l_3_2 = pcall(MpCommon.CommandLineToArgv, l_3_0)
  if not l_3_1 or isnull(l_3_2) or type(l_3_2) ~= "table" or #l_3_2 < 2 or 128 < #l_3_2 then
    set_research_data("SC_RepoPublish_Error", "ArgumentParseFailed", true)
    return {}
  end
  for l_3_3, l_3_4 in ipairs(l_3_2) do
    if type(l_3_4) ~= "string" then
      set_research_data("SC_RepoPublish_Error", "InvalidArgumentType", true)
      return {}
    end
  end
  local l_3_5 = {}
  local l_3_6 = {}
  local l_3_7 = 2
  while l_3_7 <= #l_3_2 do
    local l_3_8 = l_3_2[l_3_7]
    if l_3_8 == "-c" or string.sub(l_3_8, 1, 2) == "-c" then
      do
        local l_3_9 = string.sub(l_3_8, 3)
        if l_3_8 == "-c" then
          l_3_7 = l_3_7 + 1
          l_3_9 = l_3_2[l_3_7]
        end
        if isnull(l_3_9) then
          return {}
        end
        local l_3_10, l_3_11 = string.match(l_3_9, "^([^=]+)=(.*)$")
        if not isnull(l_3_10) then
          l_3_10 = string.lower(l_3_10)
          if l_3_10 == "http.extraheader" or string.match(l_3_10, "^http%..+%.extraheader$") then
            if l_3_11 == "" then
              l_3_5[l_3_10] = nil
            elseif string.match(string.lower(l_3_11), "^%s*authorization%s*:%s*%S+%s+%S") then
              l_3_5[l_3_10] = true
            end
          end
        end
        l_3_7 = l_3_7 + 1
      end
    elseif l_3_8 == "-C" or l_3_8 == "--git-dir" or l_3_8 == "--work-tree" then
      if isnull(l_3_2[l_3_7 + 1]) then
        return {}
      end
      l_3_6[#l_3_6 + 1] = l_3_8
      l_3_6[#l_3_6 + 1] = l_3_2[l_3_7 + 1]
      l_3_7 = l_3_7 + 2
    elseif string.sub(l_3_8, 1, 2) == "-C" then
      l_3_6[#l_3_6 + 1] = "-C"
      l_3_6[#l_3_6 + 1] = string.sub(l_3_8, 3)
      l_3_7 = l_3_7 + 1
    elseif string.sub(l_3_8, 1, 10) == "--git-dir=" or string.sub(l_3_8, 1, 12) == "--work-tree=" then
      do
        local l_3_12, l_3_13 = string.match(l_3_8, "^([^=]+)=(.+)$")
        if isnull(l_3_13) then
          return {}
        end
        l_3_6[#l_3_6 + 1] = l_3_12
        l_3_6[#l_3_6 + 1] = l_3_13
        l_3_7 = l_3_7 + 1
      end
    elseif l_3_8 == "--no-pager" or l_3_8 == "--no-optional-locks" or l_3_8 == "--literal-pathspecs" then
      l_3_7 = l_3_7 + 1
    else
      if string.sub(l_3_8, 1, 1) == "-" or isnull(l_3_8) then
        return {}
      end
      return {
        argv = l_3_2,
        index = l_3_7,
        action = l_3_8,
        selectors = table.concat(l_3_6, "\000"),
        authorization = next(l_3_5) ~= nil
      }
    end
  end
  return {}
end

local l_0_9 = l_0_8(l_0_1.command)
local l_0_10 = l_0_8(l_0_2.command)
local l_0_11 = l_0_8(l_0_3.command)
local l_0_12 = l_0_8(l_0_4.command)
local l_0_13 = l_0_8(l_0_5.command)
if isnull(l_0_9) or isnull(l_0_10) or isnull(l_0_11) or isnull(l_0_12) or isnull(l_0_13) then
  return mp.CLEAN
end
if l_0_9.action ~= "init" or l_0_10.action ~= "add" or l_0_11.action ~= "commit" or l_0_12.action ~= "remote" or l_0_13.action ~= "push" or not l_0_13.authorization then
  return mp.CLEAN
end
for l_0_14, l_0_15 in ipairs({
  l_0_10,
  l_0_11,
  l_0_12,
  l_0_13
}) do
  if l_0_15.selectors ~= l_0_9.selectors then
    return mp.CLEAN
  end
end

local function l_0_16(l_4_0)
  local l_4_1 = l_4_0.index + 1
  while l_4_1 <= #l_4_0.argv do
    local l_4_2 = l_4_0.argv[l_4_1]
    if l_4_2 == "--" then
      return false
    end
    if l_4_2 == "--help" or l_4_2 == "-h" or l_4_2 == "--dry-run" or l_4_0.action == "add" and l_4_2 == "-n" then
      return true
    end
    if l_4_0.action == "commit" and (l_4_2 == "-m" or l_4_2 == "--message" or l_4_2 == "-F" or l_4_2 == "--file" or l_4_2 == "-C" or l_4_2 == "--reuse-message" or l_4_2 == "-c" or l_4_2 == "--reedit-message") then
      l_4_1 = l_4_1 + 2
    else
      l_4_1 = l_4_1 + 1
    end
  end
  return false
end

if l_0_16(l_0_9) or l_0_16(l_0_10) or l_0_16(l_0_11) or #l_0_10.argv <= l_0_10.index then
  return mp.CLEAN
end
local l_0_17 = l_0_12.index + 1
local l_0_18 = l_0_12.argv[l_0_17]
local l_0_19 = l_0_12.argv[l_0_17 + 1]
local l_0_20 = l_0_12.argv[l_0_17 + 2]
if not ((l_0_18 == "add" or l_0_18 == "set-url") and not isnull(l_0_19) and string.sub(l_0_19, 1, 1) ~= "-" and not isnull(l_0_20) and #l_0_12.argv == l_0_17 + 2 and string.match(string.lower(l_0_20), "^https?://[^/%s]+")) or string.find(l_0_20, "%s") then
  return mp.CLEAN
end
local l_0_21 = {
  ["-o"] = true,
  ["--push-option"] = true,
  ["--receive-pack"] = true,
  ["--exec"] = true
}
local l_0_22 = {
  ["-u"] = true,
  ["--set-upstream"] = true,
  ["-f"] = true,
  ["--force"] = true,
  ["--force-with-lease"] = true,
  ["--force-if-includes"] = true,
  ["--all"] = true,
  ["--tags"] = true,
  ["--mirror"] = true,
  ["--follow-tags"] = true,
  ["-q"] = true,
  ["--quiet"] = true,
  ["-v"] = true,
  ["--verbose"] = true,
  ["--atomic"] = true,
  ["--no-verify"] = true,
  ["--progress"] = true,
  ["--porcelain"] = true
}
local l_0_23
local l_0_24 = true
local l_0_25 = l_0_13.index + 1
while l_0_25 <= #l_0_13.argv do
  local l_0_26 = l_0_13.argv[l_0_25]
  if l_0_24 and l_0_26 == "--" then
    l_0_24 = false
  elseif l_0_24 and (l_0_26 == "-n" or l_0_26 == "--dry-run" or l_0_26 == "-h" or l_0_26 == "--help") then
    return mp.CLEAN
  elseif l_0_24 and l_0_21[l_0_26] then
    if isnull(l_0_13.argv[l_0_25 + 1]) then
      return mp.CLEAN
    end
    l_0_25 = l_0_25 + 1
  elseif l_0_24 and l_0_26 == "--repo" then
    if not isnull(l_0_23) or isnull(l_0_13.argv[l_0_25 + 1]) then
      return mp.CLEAN
    end
    l_0_23 = l_0_13.argv[l_0_25 + 1]
    l_0_25 = l_0_25 + 1
  elseif l_0_24 and string.sub(l_0_26, 1, 7) == "--repo=" then
    if not isnull(l_0_23) then
      return mp.CLEAN
    end
    l_0_23 = string.sub(l_0_26, 8)
  elseif l_0_24 and string.sub(l_0_26, 1, 1) == "-" then
    if not l_0_22[l_0_26] and not string.match(l_0_26, "^%-%-force%-with%-lease=.+") and not string.match(l_0_26, "^%-%-push%-option=.+") then
      return mp.CLEAN
    end
  elseif isnull(l_0_23) then
    l_0_23 = l_0_26
  end
  l_0_25 = l_0_25 + 1
end
if l_0_23 ~= l_0_19 and l_0_23 ~= l_0_20 then
  return mp.CLEAN
end
bm.add_related_string("SupplyChainContext", "GitPublicationSequence", bm.RelatedStringBMReport)
bm.add_related_string("PublicationScope", "ActorOnlyRepoAndCredentialsUnproven", bm.RelatedStringBMReport)
return mp.INFECTED
