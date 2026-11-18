-- Threat: !InfrastructureShared
-- Name: !#Lua:Script/SuspAutoit3LNK.B
-- Type: 24
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:IS_Lnk & (MpOnModifiedCloseRtpScan | MpOnOpenOrCloseRtpScan)

local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\microsoft\\windows\\recent", 1, true) then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:ParentProcNameAttr!cmd.exe") and not mp.get_mpattribute("Lua:LnkTargetFnameExt!exe") and not mp.get_mpattribute("Lua:LnkTargetLastFolder2!appdata") then
  return mp.CLEAN
end
local l_0_1 = mp.GetLnkInfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.BasePath
if l_0_2 ~= nil and 1 < #l_0_2 and IsKeyInRollingQueue("RenamedAutoitPath", string.lower(l_0_2), true) then
  return mp.INFECTED
end
return mp.CLEAN
