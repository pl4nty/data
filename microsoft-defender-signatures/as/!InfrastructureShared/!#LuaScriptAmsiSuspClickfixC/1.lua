-- Threat: !InfrastructureShared
-- Name: !#Lua:Script/AmsiSuspClickfix.C
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: SCRIPT:FromWebClipWriteFilter.A

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("IsProcessChainFromWebClipWrite", l_0_0, true) then
  return mp.INFECTED
else
  local l_0_1 = mp.GetParentProcInfo(l_0_0)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if l_0_1.ppid and IsKeyInRollingQueue("IsProcessChainFromWebClipWrite", l_0_1.ppid, true) then
    return mp.INFECTED
  end
end
if not mp.get_mpattribute("MpPowershellAmsiViaCmdLine") then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if 2048 < l_0_2 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = mp.readfile(0, l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = string.lower(tostring(l_0_3))
if IsKeyInRollingQueue("IsTerminalFixCMD", l_0_3, true) then
  mp.set_mpattribute("Lua:AmsiSuspClickfixTerminalFixCMD")
end
return mp.CLEAN
