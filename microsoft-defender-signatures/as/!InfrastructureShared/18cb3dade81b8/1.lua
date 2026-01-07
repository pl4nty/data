-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\18cb3dade81b8\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC17: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
  else
  end
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

  if ((this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil and (this_sigattrlog[6]).utf8p2 ~= "" and (this_sigattrlog[6]).utf8p2 == nil) or (this_sigattrlog[6]).utf8p2 == "" then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_5 = (bm.get_imagepath)()
  if (bm.get_current_process_startup_info)() == nil then
    return mp.CLEAN
  end
  local l_0_6 = nil
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R3 in 'UnsetPending'

  if ((bm.get_current_process_startup_info)()).command_line == nil or ((bm.get_current_process_startup_info)()).command_line == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC64: Confused about usage of register: R3 in 'UnsetPending'

  if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) or IsExcludedByImagePathMacOS(l_0_5) then
    return mp.CLEAN
  end
  if is_valid_ip(l_0_4) then
    (bm.trigger_sig)("GenericReverseShell", l_0_5, l_0_6.ppid)
    ;
    (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected")
    return mp.INFECTED
  end
  return mp.CLEAN
end

