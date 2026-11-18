-- Threat: !InfrastructureShared
-- Name: 1d5b3942ec61c
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_1 then
  local l_0_2 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSUserName)
  local l_0_3 = bm.get_imagepath()
  local l_0_4 = "SuspTool_" .. l_0_2
  local l_0_5 = MpCommon.QueryPersistContextNoPath(l_0_4, l_0_3)
  if not l_0_5 then
    MpCommon.AppendPersistContextNoPath(l_0_4, l_0_3, 28800)
  end
  local l_0_6 = MpCommon.GetPersistContextCountNoPath(l_0_4)
  if 2 < l_0_6 then
    local l_0_7 = MpCommon.QuerySessionInformation(l_0_0.ppid, MpCommon.WTSClientAddress)
    bm.add_related_string("bmurl", l_0_7.Address, bm.RelatedStringBMReport)
    local l_0_8 = MpCommon.GetPersistContextNoPath(l_0_4)
    if l_0_8 then
      for l_0_9, l_0_10 in ipairs(l_0_8) do
        bm.add_related_file(l_0_10)
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
