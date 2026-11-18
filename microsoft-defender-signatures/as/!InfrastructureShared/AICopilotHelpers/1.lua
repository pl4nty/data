-- Threat: !InfrastructureShared
-- Name: AICopilotHelpers
-- Type: 1
-- Includes: BMLuaLib, ResearchData

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function basename(p1_0)
  if p1_0 then
    local r1_0 = string.lower(p1_0)
    return r1_0:match("([^\\/:]+)$")
  end
  return nil
end

function initiating_process_gate()
  local r2_0 = {
    outlook = true, olk = true, winword = true, msedge = true, msedgewebview2 = true, chrome = true,
    ["ms-teams"] = true, teams = true
  }
  local r2_1 = mp.GetParentProcInfo()
  if r2_1 and r2_1.image_path then
    local r2_2 = basename(r2_1.image_path)
    if r2_2 then
      local r2_3 = r2_2:gsub("%.exe$", "")
      r2_3 = r2_0[r2_3]
      r2_3 = r2_3 == true
      return r2_3
    end
    return false
  end
  return false
end

local function r0_0(p3_0)
  if p3_0 and p3_0 ~= "" then
    local r3_0 = p3_0:gsub("^%s+", "")
    p3_0 = r3_0
    local r3_1 = p3_0
    r3_0 = r3_1.match
    r3_0 = r3_0(r3_1, '^"([^"]+)"')
    if r3_0 then
      return r3_0
    end
    return p3_0:match("^([^%s]+)")
  end
  return nil
end

local function r0_1(p4_0)
  if p4_0 and p4_0 ~= "" then
    local r4_0 = p4_0:gsub("^%s+", "")
    r4_0 = r4_0:gsub("%s+$", "")
    p4_0 = r4_0
    local r4_1 = p4_0
    r4_0 = r4_1.gsub
    r4_0 = r4_0(r4_1, '^"', "")
    r4_1 = r4_0
    r4_0 = r4_1.gsub
    r4_0 = r4_0(r4_1, '"$', "")
    p4_0 = r4_0
    r4_1 = p4_0
    r4_0 = r4_1.match
    r4_0 = r4_0(r4_1, "([^\\/:]+)$") or p4_0
    return r4_0
  end
  return nil
end

local function r0_2(p5_0)
  if p5_0 and p5_0 ~= "" then
    local r5_0 = r0_1(r0_0(p5_0))
    local r5_1, r5_2, r5_3 = pcall(commandline_to_argv, p5_0)
    if r5_1 and r5_2 > 0 and r5_3 ~= nil and r5_3[1] ~= nil and r5_3[1] ~= "" then
      local r5_4 = r0_1(r5_3[1])
      if r5_0 == nil or r5_4 == r5_0 then
        return r5_4
      end
    end
    return r5_0
  end
  return nil
end

function browser_executable_from_scanned_cmdline_gate()
  local r6_0 = mp.GetScannedPPID()
  if r6_0 then
    local r6_1 = mp.GetProcessCommandLine(r6_0)
    if r6_1 and r6_1 ~= "" then
      local r6_2 = r0_2(r6_1)
      if r6_2 and r6_2 ~= "" then
        r6_2 = string.lower(r6_2):gsub("%.exe$", "")
        local r6_3 = r6_2 == "msedge" or r6_2 == "msedgewebview2" or r6_2 == "chrome"
        return r6_3
      end
      return false
    end
    return false
  end
  return false
end

function urldecode(p7_0)
  if p7_0 then
    return (p7_0:gsub("%%(%x%x)",
      function(p8_0)
        return string.char(tonumber(p8_0, 16))
      end))
  end
  return nil
end

local function r0_3(p9_0)
  if p9_0 and p9_0 ~= "" then
    local r9_0 = string.lower(p9_0)
    local r9_1 = r9_0:match("^https?://([^/%?\"']+)")
    if r9_1 then
      local r9_2 = r9_1:match("^([^:]+)")
      r9_1 = r9_2 or r9_1
      local r9_3 = r9_0
      r9_2 = r9_3.match
      r9_2 = r9_2(r9_3, "^https?://[^/%?\"']+([^?\"']*)") or "/"
      r9_2 = r9_2 == "" and "/" or r9_2
      r9_3 = r9_1
      local r9_4 = r9_2
      return r9_3, r9_4
    end
    return nil, nil
  end
  return nil, nil
end

local function r0_4(p10_0)
  if p10_0 and p10_0 ~= "" then
    return p10_0 == "copilot.microsoft.com"
      or p10_0 == "m365.cloud.microsoft"
      or p10_0 == "chatgpt.com"
      or p10_0 == "chat.openai.com"
      or p10_0 == "perplexity.ai"
      or p10_0 == "claude.ai"
      or p10_0 == "grok.com"
      or p10_0 == "chat.deepseek.com"
  end
  return false
end

local function r0_5(p11_0, p11_1)
  if p11_0 and p11_1 then
    if p11_0 == "perplexity.ai" then
      return p11_1 == "/search"
    end
    if p11_0 == "m365.cloud.microsoft" then
      return p11_1 == "/search" or p11_1 == "/search/"
    end
    if p11_0 ~= "copilot.microsoft.com" and p11_0 ~= "chatgpt.com" and p11_0 ~= "chat.openai.com" then
      if p11_0 == "claude.ai" then
        return p11_1 == "/" or p11_1 == "/new"
      end
      if p11_0 == "grok.com" or p11_0 == "chat.deepseek.com" then
        return p11_1 == "/"
      end
      return false
    end
    return p11_1 == "/"
  end
  return false
end

local function r0_6(p12_0)
  if p12_0 and p12_0 ~= "" then
    for r12_0 in p12_0:gmatch("https?://[^%s\"']+") do
      return r12_0
    end
    local r12_1 = urldecode(p12_0)
    if r12_1 and r12_1 ~= p12_0 then
      for r12_2 in r12_1:gmatch("https?://[^%s\"']+") do
        return r12_2
      end
    end
    local r12_3 = string.lower(p12_0):match("([%w%-%._]+%[%.[%]]%w[%w%-%._]+[^%s\"']*)")
    if r12_3 then
      return r12_3
    end
    return nil
  end
  return nil
end

local function r0_7(p13_0)
  if p13_0 and p13_0 ~= "" then
    for r13_0 in p13_0:gmatch("https?://[^%s\"']+") do
      local r13_1, r13_2 = r0_3(r13_0)
      if r0_4(r13_1) and r0_5(r13_1, r13_2) then
        return r13_0
      end
    end
    local r13_3 = urldecode(p13_0)
    if r13_3 and r13_3 ~= p13_0 then
      for r13_4 in r13_3:gmatch("https?://[^%s\"']+") do
        local r13_5, r13_6 = r0_3(r13_4)
        if r0_4(r13_5) and r0_5(r13_5, r13_6) then
          return r13_4
        end
      end
    end
    return nil
  end
  return nil
end

local function r0_8(p14_0)
  if p14_0 and p14_0 ~= "" then
    local r14_0 = string.lower(p14_0)
    local r14_1 = {
      "?q=", "&q=", "?q%3d", "&q%3d", "%3fq%3d", "%26q%3d", "&amp;q=", "&amp;q%3d",
      "&amp;amp;amp;amp;q="
    }
    local r14_2, r14_3 = nil, nil
    for r14_4, r14_5 in ipairs(r14_1) do
      local r14_6 = string.find(r14_0, r14_5, 1, true)
      if r14_6 and (not r14_2 or r14_6 < r14_2) then
        r14_2 = r14_6
        r14_3 = #r14_5
      end
    end
    if r14_2 then
      local r14_7 = p14_0:sub(r14_2 + r14_3)
      local r14_8 = #r14_7 + 1
      for r14_9, r14_10 in ipairs({ "&", '"', "'", " " }) do
        local r14_11 = string.find(r14_7, r14_10, 1, true)
        if r14_11 and r14_11 < r14_8 then
          r14_8 = r14_11
        end
      end
      r14_7 = r14_7:sub(1, r14_8 - 1)
      local r14_12 = urldecode(r14_7)
      local r14_13 = r14_12 or r14_7
      r14_12 = r14_13.gsub
      r14_12 = r14_12(r14_13, "^%s+", "")
      r14_13 = r14_12
      r14_12 = r14_13.gsub
      r14_12 = r14_12(r14_13, "%s+$", "")
      r14_7 = r14_12
      if r14_7 == "" then
        return nil
      end
      return r14_7
    end
    return nil
  end
  return nil
end

local function r0_9(p15_0)
  local r15_0 = r0_7(p15_0)
  if r15_0 then
    return r0_8(r15_0)
  end
  return nil
end

local function r0_10(p16_0)
  if p16_0 and p16_0 ~= "" then
    local r16_0 = string.lower(p16_0)
    if string.find(r16_0, "google.com/url?", 1, true) == nil
      and string.find(r16_0, "urldefense.com/", 1, true) == nil
      and string.find(r16_0, "safelinks.protection.outlook.com/", 1, true) == nil then
      local r16_1 = r0_7(p16_0)
      if r16_1 then
        local r16_2, r16_3 = r0_3(r16_1)
        if r0_4(r16_2) then
          if r0_5(r16_2, r16_3) then
            return r0_8(r16_1) ~= nil
          end
          return false
        end
        return false
      end
      return false
    end
    return false
  end
  return false
end

local function r0_11(p17_0)
  local r17_0 = r0_7(p17_0)
  if r17_0 then
    local r17_1 = r0_3(r17_0)
    if r17_1 and r17_1 ~= "" then
      return r17_1
    end
    return nil
  end
  return nil
end

local function r0_12()
  local r18_0 = mp.GetScannedPPID()
  if r18_0 then
    local r18_1 = mp.GetProcessCommandLine(r18_0)
    if r18_1 and r18_1 ~= "" then
      return r18_0, r18_1
    end
    return r18_0, nil
  end
  return nil, nil
end

local function r0_13()
  local r19_0, r19_1 = r0_12()
  if r19_1 then
    local r19_2 = string.lower(r19_1)
    local r19_3 = string.find(r19_2, "\\msedge.exe", 1, true)
    r19_3 = r19_3 ~= nil
      or string.find(r19_2, "\\chrome.exe", 1, true) ~= nil
      or string.find(r19_2, "\\brave.exe", 1, true) ~= nil
      or string.find(r19_2, "\\opera.exe", 1, true) ~= nil
      or string.find(r19_2, "\\vivaldi.exe", 1, true) ~= nil
    local r19_4 = string.find(r19_2, "\\firefox.exe", 1, true)
    r19_4 = r19_4 ~= nil
    if not r19_3 and not r19_4 then
      return false
    end
    local r19_5 = string.find(r19_2, "--single-argument", 1, true)
    r19_5 = r19_5 ~= nil
    local r19_6 = string.find(r19_2, "-osint", 1, true)
    r19_6 = r19_6 ~= nil and string.find(r19_2, "-url", 1, true) ~= nil
    return r19_3 and r19_5 or r19_4 and r19_6
  end
  return false
end

function current_cmdline_matches_prompt_link_runtime_checks()
  local r20_0, r20_1 = r0_12()
  if r20_1 then
    if r0_13() then
      if r0_10(r20_1) then
        return true
      end
      return false
    end
    return false
  end
  return false
end

function extract_first_non_copilot_url(p21_0)
  if p21_0 and p21_0 ~= "" then
    for r21_0 in p21_0:gmatch("https?://[^%s\"']+") do
      local r21_1 = string.lower(r21_0)
      if not r21_1:find("copilot%.microsoft%.com", 1, false) then
        return r21_0
      end
    end
    local r21_2 = urldecode(p21_0)
    if r21_2 and r21_2 ~= p21_0 then
      for r21_3 in r21_2:gmatch("https?://[^%s\"']+") do
        local r21_4 = string.lower(r21_3)
        if not r21_4:find("copilot%.microsoft%.com", 1, false) then
          return r21_3
        end
      end
    end
    local r21_5 = string.lower(p21_0)
    local r21_6 = r21_5:match("([%w%-%._]+%[%.[%]]%w[%w%-%._]+[^%s\"']*)")
    if r21_6 and not r21_6:find("copilot%.microsoft%.com", 1, false) then
      return r21_6
    end
    return nil
  end
  return nil
end

function normalize_parent_process_name(p22_0)
  if p22_0 ~= nil and p22_0.image_path ~= nil then
    local r22_0 = basename(p22_0.image_path)
    if r22_0 == nil then
      return nil
    end
    local r22_1 = r22_0:gsub('^"', "")
    return r22_1:gsub('"$', "")
  end
  return nil
end

function current_parent_info_and_name()
  local r23_0 = mp.GetParentProcInfo()
  return r23_0, normalize_parent_process_name(r23_0)
end

function extract_cmdline_payload(p24_0)
  local r24_0 = mp.GetScannedPPID()
  if not r24_0 then
    return
  end
  if p24_0 == nil or p24_0 == "" then
    local r24_1 = mp.GetParentProcInfo()
    if r24_1 and r24_1.image_path then
      p24_0 = string.lower(r0_1(r24_1.image_path))
    end
  end
  local r24_2 = mp.GetProcessCommandLine(r24_0)
  if not (r24_2 and r24_2 ~= "") then
    return
  end
  local r24_3 = r0_2(r24_2)
  if r24_3 and r24_3 ~= "" then
    set_research_data("Browser", string.lower(r24_3), false)
  end
  if p24_0 and p24_0 ~= "" then
    set_research_data("ParentApp", p24_0, false)
  end
  local r24_4 = r0_11(r24_2)
  if r24_4 and r24_4 ~= "" then
    set_research_data("AIService", r24_4, false)
  end
  local r24_5 = MpCommon.Base64Encode(r24_2)
  if r24_5 then
    set_research_data("CmdLineB64", r24_5, false)
  end
  local r24_6 = r0_9(r24_2)
  if r24_6 and r24_6 ~= "" then
    local r24_7 = MpCommon.Base64Encode(r24_6)
    if r24_7 then
      set_research_data("PromptB64", r24_7, false)
    end
  end
  local r24_8 = r24_6 and r0_6(r24_6) or nil
  if r24_8 and r24_8 ~= "" then
    local r24_9 = MpCommon.Base64Encode(r24_8)
    if r24_9 then
      set_research_data("UrlB64", r24_9, false)
    end
  end
end
