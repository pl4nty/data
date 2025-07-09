-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c1b326115f29\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) then
  return mp.CLEAN
end
do
  if l_0_0.integrity_level <= MpCommon.SECURITY_MANDATORY_HIGH_RID then
    local l_0_1 = (MpCommon.GetProcessElevationAndIntegrityLevel)(l_0_0.ppid)
    if l_0_1 and next(l_0_1) and l_0_1.IntegrityLevel and l_0_1.IntegrityLevel <= MpCommon.SECURITY_MANDATORY_HIGH_RID then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

