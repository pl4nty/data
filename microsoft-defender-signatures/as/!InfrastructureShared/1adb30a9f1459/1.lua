-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1adb30a9f1459\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 ~= nil and l_1_0.matched == true and l_1_0.utf8p2 ~= nil and l_1_0.utf8p2 ~= "" then
    return l_1_0
  end
  return nil
end

local l_0_1 = function(l_2_0)
  -- function num : 0_1
  do return l_2_0 end
  -- WARNING: undefined locals caused missing assignments!
end

do
  if not l_0_0(this_sigattrlog[1]) and not l_0_0(this_sigattrlog[2]) and not l_0_0(this_sigattrlog[3]) and not l_0_0(this_sigattrlog[4]) and not l_0_0(this_sigattrlog[5]) and not l_0_0(this_sigattrlog[6]) and not l_0_0(this_sigattrlog[7]) and not l_0_0(this_sigattrlog[8]) and not l_0_0(this_sigattrlog[9]) and not l_0_0(this_sigattrlog[10]) and not l_0_0(this_sigattrlog[11]) then
    local l_0_2, l_0_3 = l_0_0(this_sigattrlog[12])
  end
  -- DECOMPILER ERROR at PC72: Confused about usage of register: R2 in 'UnsetPending'

  if l_0_2 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC80: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_4 = nil
  local l_0_5 = nil
  if l_0_1((string.lower)(tostring(l_0_2.utf8p2))) < 32 or l_0_1((string.lower)(tostring(l_0_2.utf8p2))) > 259 then
    return mp.CLEAN
  end
  local l_0_6 = nil
  local l_0_7 = tostring(l_0_4.utf8p1)
  if l_0_7 ~= nil and contains(l_0_7, {"://chatgpt.com", ".microsoft.com/", "://m365.cloud.microsoft/", ".visualstudio.com/", ".sharepoint.com/", "://github.com/", "://localhost", "://127.0.", ".reddit.com/", ".google.com/", "/wiki/", "://opencode.ai/", "://web.whatsapp.com/", "://www.bing.com/search", "://www.youtube.com/watch", "://outlook.cloud.microsoft/", "://antigravity.google/", "://grok.com/", "/wikis/", "://learn.", "://docs.", "/chat/", "://chat.", "://wiki.", "://forum.", "://search.naver.com/", "://bun.com/", "://discord.com/"}) then
    return mp.CLEAN
  end
  AppendToRollingQueue("IsFromWebClipWrite", l_0_5, l_0_7, 300)
  return mp.CLEAN
end

