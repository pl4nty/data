-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c2b3ba5ad709\1.luac 

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
local l_0_2 = function(l_1_0)
  -- function num : 0_0
  do
    local l_1_2 = nil
    if (l_1_0:match("\"[^\"]*\\node%.exe\"%s+\"([^\"]+)\"") or l_1_2) and (function(l_2_0)
    -- function num : 0_0_0
    return not l_2_0:match("%.[%a%d]+$")
  end
)(l_1_2) then
      return l_1_2
    end
    -- DECOMPILER ERROR at PC26: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

    if (l_1_0:match("%snode%.exe%s+\"([^\"]+)\"") or l_1_2) and (function(l_2_0)
    -- function num : 0_0_0
    return not l_2_0:match("%.[%a%d]+$")
  end
)(l_1_2) then
      return l_1_2
    end
    -- DECOMPILER ERROR at PC43: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

    if (l_1_0:match("%snode%s+\"([^\"]+)\"") or l_1_2) and (function(l_2_0)
    -- function num : 0_0_0
    return not l_2_0:match("%.[%a%d]+$")
  end
)(l_1_2) then
      return l_1_2
    end
    -- DECOMPILER ERROR at PC65: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC68: Confused about usage of register: R2 in 'UnsetPending'

    if (l_1_0:match("\"[^\"]*\\node%.exe\"%s+([^%s]+)") or l_1_0:match("%snode%.exe%s+([^%s]+)") or l_1_2) and (function(l_2_0)
    -- function num : 0_0_0
    return not l_2_0:match("%.[%a%d]+$")
  end
)(l_1_2) then
      return l_1_2
    end
    do return nil end
    -- DECOMPILER ERROR at PC76: freeLocal<0 in 'ReleaseLocals'

  end
end

local l_0_3 = l_0_2(l_0_1)
if l_0_3 == nil then
  return mp.CLEAN
end
if not StringEndsWith(l_0_3, "\\") then
  l_0_3 = l_0_3 .. "\\"
end
l_0_3 = l_0_3 .. "index.js"
if (sysio.IsFileExists)(l_0_3) then
  (mp.ReportLowfi)(l_0_3, 831585867)
  return mp.INFECTED
else
  ;
  (bm.trigger_sig)("SuspNodeJSExecInSpecificFolderB", l_0_3)
end
return mp.CLEAN

