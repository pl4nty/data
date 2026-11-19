-- Threat: !InfrastructureShared
-- Name: 1adb30a9f1459
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0)
  if p1_0 == nil or p1_0.matched ~= true or p1_0.utf8p2 == nil or p1_0.utf8p2 == "" then
    return nil
  end
  return p1_0
end

local function r0_1(p2_0)
  local r2_0, r2_1 = p2_0:gsub("[^\128-\191]", "")
  return r2_1
end

local r0_2 = r0_0(this_sigattrlog[1])
  or r0_0(this_sigattrlog[2])
  or r0_0(this_sigattrlog[3])
  or r0_0(this_sigattrlog[4])
  or r0_0(this_sigattrlog[5])
  or r0_0(this_sigattrlog[6])
  or r0_0(this_sigattrlog[7])
  or r0_0(this_sigattrlog[8])
  or r0_0(this_sigattrlog[9])
  or r0_0(this_sigattrlog[10])
  or r0_0(this_sigattrlog[11])
  or r0_0(this_sigattrlog[12])
if r0_2 == nil then
  return mp.CLEAN
end
local r0_3 = string.lower(tostring(r0_2.utf8p2))
local r0_4 = r0_1(r0_3)
if not (r0_4 < 32) and not (r0_4 > 259) then
  local r0_5 = tostring(r0_2.utf8p1)
  local r0_6 = {
    "://chatgpt.com", ".microsoft.com/", "://m365.cloud.microsoft/", ".visualstudio.com/",
    ".sharepoint.com/", "://github.com/", "://localhost", "://127.0.", ".reddit.com/",
    ".google.com/", "/wiki/", "://opencode.ai/", "://web.whatsapp.com/", "://www.bing.com/search",
    "://www.youtube.com/watch", "://outlook.cloud.microsoft/", "://antigravity.google/",
    "://grok.com/", "/wikis/", "://learn.", "://docs.", "/chat/", "://chat.", "://wiki.",
    "://forum.", "://search.naver.com/", "://bun.com/", "://discord.com/", "://muse.ai/",
    "://use.ai/", "://ask-chat.ai/", "://herdr.dev/"
  }
  if r0_5 ~= nil and contains(r0_5, r0_6) then
    return mp.CLEAN
  end
  AppendToRollingQueue("IsFromWebClipWrite", r0_3, r0_5, 300)
  return mp.CLEAN
end
return mp.CLEAN
