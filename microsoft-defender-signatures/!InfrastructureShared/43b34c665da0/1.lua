-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b34c665da0\1.luac 

-- params : ...
-- function num : 0
if not IsKeyInRollingQueue("PowershellAMSIpatch_Bytes", "Bytes", true) then
  return mp.CLEAN
end
local l_0_0 = GetRollingQueueKeyValue("PowershellAMSIpatch_Bytes", "Bytes")
if isnull(l_0_0) then
  return mp.CLEAN
end
;
(bm.add_related_string)("AMSIBYTES:", l_0_0, bm.RelatedStringBMReport)
pcall(MpCommon.RollingQueueErase, "PowershellAMSIpatch_Bytes")
return mp.INFECTED

