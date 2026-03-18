-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bdb39de37dfc\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil or #l_0_0 <= 5 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3 = nil
  if (string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"(c:\\users\\[^\\\\]+[/\\\\]appdata[/\\\\]local[/\\\\]temp[/\\\\][^/\\\\\"]+%.js)\"") == nil or #(string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"(c:\\users\\[^\\\\]+[/\\\\]appdata[/\\\\]local[/\\\\]temp[/\\\\][^/\\\\\"]+%.js)\"") <= 10 then
    return mp.CLEAN
  end
  if (sysio.IsFileExists)((string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"(c:\\users\\[^\\\\]+[/\\\\]appdata[/\\\\]local[/\\\\]temp[/\\\\][^/\\\\\"]+%.js)\"")) then
    (mp.ReportLowfi)((string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"(c:\\users\\[^\\\\]+[/\\\\]appdata[/\\\\]local[/\\\\]temp[/\\\\][^/\\\\\"]+%.js)\""), 2929466810)
    return mp.INFECTED
  else
    ;
    (bm.trigger_sig)("NodeJsLoadedInTempFolderB", (string.match)(l_0_0, "\"[^\"]*[/\\\\]node%.exe\"%s+\"(c:\\users\\[^\\\\]+[/\\\\]appdata[/\\\\]local[/\\\\]temp[/\\\\][^/\\\\\"]+%.js)\""))
  end
  return mp.CLEAN
end

