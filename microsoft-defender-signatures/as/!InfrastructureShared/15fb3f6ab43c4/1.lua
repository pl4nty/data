-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15fb3f6ab43c4\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil or #l_0_0 <= 5 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

  if (string.find)(l_0_0, " start ", 1, true) == nil or (string.find)(l_0_0, " /min ", 1, true) == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_5 = nil
  if (string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\"") == nil or #(string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\"") <= 10 then
    return mp.CLEAN
  end
  if (string.find)((string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\""), "\\appdata\\local\\", 1, true) == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC98: Confused about usage of register: R1 in 'UnsetPending'

  if StringEndsWith((string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\""), ".js") or (not StringEndsWith((string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\""), "\\") or (sysio.IsFileExists)((string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\"") .. "index.js" .. "\\index.js")) then
    (mp.ReportLowfi)((string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\"") .. "index.js" .. "\\index.js", 851748235)
    return mp.INFECTED
  else
    -- DECOMPILER ERROR at PC108: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (bm.trigger_sig)("SuspNodeJsInAppDataB", (string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"([^\"]+)\"") .. "index.js" .. "\\index.js")
  end
  return mp.CLEAN
end

