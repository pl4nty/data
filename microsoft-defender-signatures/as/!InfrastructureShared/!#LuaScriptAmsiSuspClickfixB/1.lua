-- Threat: !InfrastructureShared
-- Name: !#Lua:Script/AmsiSuspClickfix.B
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: Lua:AmsiAppContextData:Proc:VBScript & SCPT:JSRunsFile_1

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_AMSI then
  local r0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if r0_0 == nil then
    return mp.CLEAN
  end
  local r0_1 = mp.GetProcessCommandLine(r0_0)
  if r0_1 == nil then
    return mp.CLEAN
  end
  r0_1 = string.gsub(r0_1, '"', "")
  r0_1 = string.gsub(r0_1, "'", "")
  if 0
    + str_count_match(r0_1,
      { "mshta", "http", " \226[\128-\191][\128-\191] ", " \240[\128-\191][\128-\191][\128-\191] " })
    < 2 then
    return mp.CLEAN
  end
  if IsKeyInRollingQueue("IsProcessChainViaRUNMRU", r0_0, true) then
    return mp.INFECTED
  end
  local r0_2 = mp.GetParentProcInfo(r0_0)
  if r0_2 == nil then
    return mp.CLEAN
  end
  if r0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", r0_2.ppid, true) then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
