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

do
  if not l_0_0(this_sigattrlog[1]) and not l_0_0(this_sigattrlog[2]) and not l_0_0(this_sigattrlog[3]) and not l_0_0(this_sigattrlog[4]) and not l_0_0(this_sigattrlog[5]) and not l_0_0(this_sigattrlog[6]) and not l_0_0(this_sigattrlog[7]) and not l_0_0(this_sigattrlog[8]) and not l_0_0(this_sigattrlog[9]) and not l_0_0(this_sigattrlog[10]) and not l_0_0(this_sigattrlog[11]) then
    local l_0_1, l_0_2 = l_0_0(this_sigattrlog[12])
  end
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = nil
  if #(string.lower)(tostring(l_0_1.utf8p2)) < 32 or #(string.lower)(tostring(l_0_1.utf8p2)) > 259 then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_5 = tostring(l_0_3.utf8p1)
  if l_0_5 ~= nil and contains(l_0_5, {"://chatgpt.com", ".microsoft.com/", "://m365.cloud.microsoft/", ".visualstudio.com/", ".sharepoint.com/", "://github.com/", "://localhost", "://127.0.", ".reddit.com/", ".google.com/", "/wiki/", "://opencode.ai/", "://web.whatsapp.com/", "://www.bing.com/search", "://www.youtube.com/watch", "://outlook.cloud.microsoft/", "/wikis/", "://learn.", "://docs.", "/chat/", "://chat.", "://wiki.", "://forum."}) then
    return mp.CLEAN
  end
  AppendToRollingQueue("IsFromWebClipWrite", l_0_4, l_0_5, 300)
  return mp.CLEAN
end

