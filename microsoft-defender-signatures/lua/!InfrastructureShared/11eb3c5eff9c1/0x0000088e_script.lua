-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11eb3c5eff9c1\0x0000088e_luac 

-- params : ...
-- function num : 0
local l_0_1, l_0_2 = nil, nil
if not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p2 == nil or (this_sigattrlog[8]).utf8p2 == "" or (this_sigattrlog[8]).utf8p1 == nil or (this_sigattrlog[8]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = nil
if (bm.get_current_process_startup_info)() == nil then
  return mp.CLEAN
end
local l_0_4 = nil
if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
  return mp.CLEAN
end
l_0_3 = (this_sigattrlog[8]).utf8p2
l_0_4 = (this_sigattrlog[8]).utf8p1
local l_0_5 = nil
for l_0_9 = mp.SIGATTR_LOG_SZ - 1, 1, -1 do
  local l_0_6, l_0_7 = nil
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R9 in 'UnsetPending'

  if sigattr_tail[R9_PC70] ~= nil and (sigattr_tail[R9_PC70]).attribute ~= nil and (sigattr_tail[R9_PC70]).attribute == 16384 and (sigattr_tail[R9_PC70]).utf8p1 ~= nil and (sigattr_tail[R9_PC70]).utf8p1 ~= "" and (string.find)((sigattr_tail[R9_PC70]).utf8p1, "%$HOME%$/") ~= 1 and ((sigattr_tail[R9_PC70]).utf8p1 == l_0_4 or (string.find)(l_0_3, ((sigattr_tail[R9_PC70]).utf8p1):match("[^/]*$"), 1, true)) then
    if SuspMacPathsToMonitor((sigattr_tail[R9_PC70]).utf8p1, true) then
      if (sysio.IsFileExists)((sigattr_tail[R9_PC70]).utf8p1) then
        (bm.trigger_sig)("BM_SusFileDownExec", (sigattr_tail[R9_PC70]).utf8p1)
      end
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN

