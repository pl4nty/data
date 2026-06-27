-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d1b3b718cbd3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((bm.get_current_process_startup_info)()).ppid
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
do
  if not l_0_1:match("[wc]script%.exe.-\"([^\"]+)\"") then
    local l_0_2, l_0_3, l_0_4 = l_0_1:match("[wc]script%.exe.-(%S+%.%a+)")
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_5 = nil
  -- DECOMPILER ERROR at PC51: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: Unhandled construct in 'MakeBoolean' P3

  if ((((string.find)(l_0_5, "\\temp\\%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x_.+%.zip%.") == nil and (string.find)(l_0_5, "\\temp\\temp[0-9]_.+%.zip$") == nil) or (string.find)(l_0_5, "\\7z", 1, true)) and not (string.find)(l_0_5, "\\appdata\\local\\temp\\7z", 1, true) and not (string.match)(l_0_5, "\\temp\\7z[%x]+$")) or ((not (string.find)(l_0_5, "\\appdata\\local\\temp\\rar$", 1, true) and not (string.match)(l_0_5, "\\rar%$.*%.rartemp$")) or nil == nil) then
    return mp.CLEAN
  end
  local l_0_6 = nil
  if l_0_5:match("%.([^%.\\]+)$") == nil then
    return mp.CLEAN
  end
  local l_0_7 = nil
  TrackPidAndTechniqueBM("BM", "T1204", "BM:ScriptInZipUserExecution.A")
  -- DECOMPILER ERROR at PC142: Confused about usage of register: R5 in 'UnsetPending'

  if "BM:ScriptInZipUserExecution.A!" .. l_0_5:match("%.([^%.\\]+)$") ~= nil then
    (bm.trigger_sig)("BM:ScriptInZipUserExecution.A!" .. l_0_5:match("%.([^%.\\]+)$"), l_0_5)
    -- DECOMPILER ERROR at PC149: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (MpCommon.AddProcessAttribute)(l_0_0, "BM:ScriptInZipUserExecution.A", "BM:ScriptInZipUserExecution.A!" .. l_0_5:match("%.([^%.\\]+)$"), true)
    -- DECOMPILER ERROR at PC158: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (MpCommon.AddProcessAttribute)(l_0_0, "BM:ScriptInZipUserExecutionArchive.A!" .. l_0_6, "BM:ScriptInZipUserExecution.A!" .. l_0_5:match("%.([^%.\\]+)$"), true)
    -- DECOMPILER ERROR at PC164: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (MpCommon.AddProcessAttribute)(l_0_0, "BM:ScriptInZipUserExecution.A!" .. l_0_5:match("%.([^%.\\]+)$"), l_0_6, true)
  end
  return mp.INFECTED
end

