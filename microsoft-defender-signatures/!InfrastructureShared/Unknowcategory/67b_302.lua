-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\67b_302.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.integrity_level ~= nil and MpCommon.SECURITY_MANDATORY_MEDIUM_RID <= l_0_0.IntegrityLevel then
  return mp.INFECTED
end
return mp.CLEAN

