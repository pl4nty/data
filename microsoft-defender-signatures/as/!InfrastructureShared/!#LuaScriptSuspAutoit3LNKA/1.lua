-- Threat: !InfrastructureShared
-- Name: !#Lua:Script/SuspAutoit3LNK.A
-- Type: 24
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:IS_Lnk & (MpOnModifiedCloseRtpScan | MpOnOpenOrCloseRtpScan)

if not mp.get_mpattribute("Lua:LnkTargetFnameExt!bat") and not mp.get_mpattribute("Lua:LnkTargetFnameExt!scr") and not mp.get_mpattribute("Lua:LnkTargetFnameExt!pif") and not mp.get_mpattribute("Lua:LnkTargetFnameExt!com") then
  return mp.CLEAN
end
local l_0_0 = mp.GetLnkInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.BasePath
if l_0_1 ~= nil and 1 < #l_0_1 and IsKeyInRollingQueue("RenamedAutoitPath", string.lower(l_0_1), true) then
  return mp.INFECTED
end
return mp.CLEAN
