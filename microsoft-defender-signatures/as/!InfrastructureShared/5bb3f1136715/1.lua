-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3f1136715\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line)
if l_0_1 == nil or #l_0_1 <= 10 then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  l_0_2 = (string.lower)((this_sigattrlog[2]).utf8p2)
end
if l_0_2 == nil or #l_0_2 <= 2 then
  return mp.CLEAN
end
local l_0_3 = function(l_1_0)
  -- function num : 0_0
  do
    local l_1_2 = nil
    if (l_1_0:match("\"[^\"]*\\node%.exe\"%s+\"([^\"]+)\"") or l_1_0:match("%snode%.exe%s+\"([^\"]+)\"") or l_1_2) and (function(l_2_0)
    -- function num : 0_0_0
    do
      if not l_2_0:match("[/\\]") then
        local l_2_1 = l_2_0:match("^%w[%w%._%-]*%.[%a%d]+$")
      else
      end
      return false
    end
  end
)(l_1_2) then
      return l_1_2
    end
    -- DECOMPILER ERROR at PC36: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

    if (l_1_0:match("\"[^\"]*\\node%.exe\"%s+([^%s]+)") or l_1_0:match("%snode%.exe%s+([^%s]+)") or l_1_2) and (function(l_2_0)
    -- function num : 0_0_0
    do
      if not l_2_0:match("[/\\]") then
        local l_2_1 = l_2_0:match("^%w[%w%._%-]*%.[%a%d]+$")
      else
      end
      return false
    end
  end
)(l_1_2) then
      return l_1_2
    end
    do return nil end
    -- DECOMPILER ERROR at PC47: freeLocal<0 in 'ReleaseLocals'

  end
end

local l_0_4 = l_0_3(l_0_1)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_2 .. l_0_4
if (sysio.IsFileExists)(l_0_5) then
  (mp.ReportLowfi)(l_0_5, 1442354168)
  return mp.INFECTED
else
  ;
  (bm.trigger_sig)("SuspNodeJSExecInCurrentFolderCB", l_0_5)
end
return mp.CLEAN

