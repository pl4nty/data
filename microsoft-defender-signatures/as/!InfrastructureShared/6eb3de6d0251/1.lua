-- Threat: !InfrastructureShared
-- Name: 6eb3de6d0251
-- Type: 21
-- Includes: BMLuaLib, ResearchData

local l_0_0 = this_sigattrlog[1]
if isnull(l_0_0) or not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if isnull(l_0_1) or type(l_0_1) ~= "string" or 32768 < #l_0_1 then
  set_research_data("SC_Oidc_Error", "CommandUnavailableOrOversize", true)
  return mp.CLEAN
end
local l_0_2, l_0_3 = pcall(MpCommon.CommandLineToArgv, l_0_1)
if not l_0_2 or isnull(l_0_3) or type(l_0_3) ~= "table" or 256 < #l_0_3 then
  set_research_data("SC_Oidc_Error", "ArgumentParseFailed", true)
  return mp.CLEAN
end
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if type(l_0_5) ~= "string" then
    set_research_data("SC_Oidc_Error", "InvalidArgumentType", true)
    return mp.CLEAN
  end
end

local function l_0_6(l_1_0)
  return (string.gsub(l_1_0, "%%(%x%x)", function(l_2_0)
    return string.char(tonumber(l_2_0, 16))
  end))
end

local function l_0_7(l_3_0)
  local l_3_1, l_3_2, l_3_3, l_3_4 = string.match(l_3_0, "^(%a+)://([^/]+)(/[^?]*)%?(.*)$")
  if isnull(l_3_1) or string.lower(l_3_1) ~= "https" then
    return false
  end
  local l_3_5 = string.lower(l_3_2)
  l_3_5 = string.gsub(l_3_5, ":443$", "")
  if isnull(string.match(l_3_5, "^[%w%-][%w%.%-]*%.actions%.githubusercontent%.com$")) then
    return false
  end
  if string.sub(l_3_3, -8) ~= "/idtoken" and not string.find(l_3_3, "/idtoken/", 1, true) then
    return false
  end
  l_3_4 = string.match(l_3_4, "^[^#]*")
  local l_3_6 = 0
  local l_3_7 = false
  for l_3_8, l_3_9 in string.gmatch("&" .. l_3_4, "&([^=&]+)=([^&]*)") do
    if l_0_6(l_3_8) == "audience" then
      l_3_6 = l_3_6 + 1
      l_3_7 = l_0_6(l_3_9) == "api://AzureADTokenExchange"
    end
  end
  return l_3_6 == 1 and l_3_7
end

local function l_0_8(l_4_0)
  return not isnull(string.match(string.lower(l_4_0), "^%s*authorization%s*:%s*bearer%s+%S"))
end

local l_0_9 = {
  ["-o"] = true,
  ["--output"] = true,
  ["-w"] = true,
  ["--write-out"] = true,
  ["-A"] = true,
  ["--user-agent"] = true,
  ["-e"] = true,
  ["--referer"] = true,
  ["-u"] = true,
  ["--user"] = true,
  ["-x"] = true,
  ["--proxy"] = true,
  ["-X"] = true,
  ["--request"] = true,
  ["--resolve"] = true,
  ["--connect-to"] = true,
  ["--cacert"] = true,
  ["--cert"] = true,
  ["--key"] = true,
  ["--interface"] = true,
  ["-m"] = true,
  ["--max-time"] = true,
  ["--connect-timeout"] = true,
  ["--retry"] = true,
  ["-d"] = true,
  ["--data"] = true,
  ["--data-raw"] = true,
  ["--data-binary"] = true,
  ["--data-urlencode"] = true,
  ["-F"] = true,
  ["--form"] = true
}
local l_0_10 = false
local l_0_11 = false
local l_0_12 = 2
while l_0_12 <= #l_0_3 do
  local l_0_13 = l_0_3[l_0_12]
  if l_0_13 == "-H" or l_0_13 == "--header" or l_0_13 == "--url" then
    do
      local l_0_14 = l_0_3[l_0_12 + 1]
      if isnull(l_0_14) then
        return mp.CLEAN
      end
      if l_0_13 == "--url" then
        l_0_11 = l_0_11 or l_0_7(l_0_14)
      else
        l_0_10 = l_0_10 or l_0_8(l_0_14)
      end
      l_0_12 = l_0_12 + 2
    end
  elseif string.sub(l_0_13, 1, 2) == "-H" then
    l_0_10 = l_0_10 or l_0_8(string.sub(l_0_13, 3))
    l_0_12 = l_0_12 + 1
  elseif string.sub(l_0_13, 1, 9) == "--header=" then
    l_0_10 = l_0_10 or l_0_8(string.sub(l_0_13, 10))
    l_0_12 = l_0_12 + 1
  elseif string.sub(l_0_13, 1, 6) == "--url=" then
    l_0_11 = l_0_11 or l_0_7(string.sub(l_0_13, 7))
    l_0_12 = l_0_12 + 1
  elseif l_0_9[l_0_13] then
    if isnull(l_0_3[l_0_12 + 1]) then
      return mp.CLEAN
    end
    l_0_12 = l_0_12 + 2
  else
    if string.sub(l_0_13, 1, 1) ~= "-" and not l_0_11 then
      l_0_11 = l_0_7(l_0_13)
    end
    l_0_12 = l_0_12 + 1
  end
end
if not l_0_10 or not l_0_11 then
  return mp.CLEAN
end
bm.add_related_string("OidcContext", "GitHubActionsAzureAudience", bm.RelatedStringBMReport)
return mp.INFECTED
