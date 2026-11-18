-- Threat: !InfrastructureShared
-- Name: 7db3e2710214
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
  l_0_1 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_1 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
  l_0_1 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
  l_0_1 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p1
  l_0_1 = this_sigattrlog[6].utf8p2
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_4 = string.find(l_0_2, "--single-argument", 1, true) ~= nil
local l_0_6 = string.find(l_0_2, "-osint", 1, true) ~= nil and string.find(l_0_2, "-url", 1, true) ~= nil
if not l_0_4 and not l_0_6 then
  return mp.CLEAN
end
local l_0_7
for l_0_8 in l_0_2:gmatch("https?://[^%s\"']+") do
  local l_0_9, l_0_10 = l_0_8:match("^https?://([^/%?\"']+)([^?\"']*)")
  if l_0_9 then
    l_0_9 = l_0_9:match("^([^:]+)") or l_0_9
    local l_0_12 = l_0_9 == "m365.cloud.microsoft" and (l_0_10 == "/search" or l_0_10 == "/search/")
    if l_0_9 == "copilot.microsoft.com" or l_0_12 or l_0_9 == "chatgpt.com" or l_0_9 == "chat.openai.com" or l_0_9 == "perplexity.ai" or l_0_9 == "claude.ai" or l_0_9 == "grok.com" or l_0_9 == "chat.deepseek.com" then
      l_0_7 = l_0_8
      break
    end
  end
end
if l_0_7 == nil then
  return mp.CLEAN
end
local l_0_14 = string.find(l_0_7, "?q=", 1, true) ~= nil or string.find(l_0_7, "&q=", 1, true) ~= nil or string.find(l_0_7, "&amp;q=", 1, true) ~= nil or string.find(l_0_7, "%3fq%3d", 1, true) ~= nil or string.find(l_0_7, "%26q%3d", 1, true) ~= nil
if not l_0_14 then
  return mp.CLEAN
end

local function l_0_15(l_1_0)
  if l_1_0 == nil then
    return nil
  end
  return string.lower(l_1_0):match("([^\\/:]+)$")
end

local function l_0_16(l_2_0)
  return l_2_0 == "winword.exe" or l_2_0 == "excel.exe" or l_2_0 == "powerpnt.exe" or l_2_0 == "outlook.exe" or l_2_0 == "olk.exe" or l_2_0 == "onenote.exe" or l_2_0 == "mspub.exe" or l_2_0 == "visio.exe" or l_2_0 == "ms-teams.exe" or l_2_0 == "teams.exe" or l_2_0 == "slack.exe" or l_2_0 == "discord.exe" or l_2_0 == "zoom.exe" or l_2_0 == "thunderbird.exe" or l_2_0 == "acrord32.exe" or l_2_0 == "acrobat.exe" or l_2_0 == "foxitpdfreader.exe" or l_2_0 == "sumatrapdf.exe"
end

local function l_0_17(l_3_0)
  return l_3_0 == "msedge.exe" or l_3_0 == "chrome.exe" or l_3_0 == "brave.exe" or l_3_0 == "opera.exe" or l_3_0 == "vivaldi.exe" or l_3_0 == "firefox.exe" or l_3_0 == "msedgewebview2.exe"
end

local function l_0_18()
  if l_0_0 ~= nil then
    bm.add_related_file(l_0_0)
  end
  for l_4_0 in l_0_2:gmatch("https?://[^%s\"']+") do
    local l_4_1 = l_4_0:match("^https?://([^/%?\"']+)")
    if l_4_1 ~= nil then
      local l_4_3 = l_4_1 == "copilot.microsoft.com" or l_4_1 == "m365.cloud.microsoft" or l_4_1 == "chatgpt.com" or l_4_1 == "chat.openai.com" or l_4_1 == "perplexity.ai" or l_4_1 == "claude.ai" or l_4_1 == "grok.com" or l_4_1 == "chat.deepseek.com"
      if not l_4_3 then
        bm.add_related_string("ReferenceUrl", l_4_0, bm.RelatedStringBMReport)
        break
      end
    end
  end
end

local l_0_19 = bm.get_imagepath()
if l_0_19 == nil then
  return mp.CLEAN
end
local l_0_20 = l_0_15(l_0_19)
if l_0_20 == nil then
  return mp.CLEAN
end
local l_0_21 = l_0_16(l_0_20)
if not l_0_21 and l_0_17(l_0_20) then
  local l_0_22, l_0_23 = bm.get_process_relationships()
  if l_0_22 ~= nil then
    for l_0_24, l_0_25 in ipairs(l_0_22) do
      local l_0_26 = l_0_15(l_0_25.image_path)
      if l_0_26 ~= nil and l_0_16(l_0_26) then
        l_0_21 = true
        break
      end
    end
  end
end
if l_0_21 then
  l_0_18()
  return mp.INFECTED
end
return mp.CLEAN
