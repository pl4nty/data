-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\102b3a172b50b\1.luac 

-- params : ...
-- function num : 0
local l_0_6 = nil
local l_0_7 = nil
local l_0_8 = ((bm.get_current_process_startup_info)()).command_line
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p1 ~= "" then
  local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = (bm.get_imagepath)()
else
  do
    -- DECOMPILER ERROR at PC43: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC68: Unhandled construct in 'MakeBoolean' P3

    -- DECOMPILER ERROR at PC68: Unhandled construct in 'MakeBoolean' P3

    if ((this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil and (this_sigattrlog[4]).utf8p1 ~= "" and l_0_6 == nil) or (string.find)(l_0_6, ".app/Contents/", 1, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R3 in 'UnsetPending'

    if IsExcludedByCmdlineMacOS(l_0_8) or not SuspMacPathsToMonitor(l_0_0, true) then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC83: Confused about usage of register: R3 in 'UnsetPending'

    if l_0_0:match("/%.[^/]+$") then
      (bm.trigger_sig)("HiddenMacPersist", l_0_6)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

