-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15b30c1a1cc6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = (MpCommon.QuerySessionInformation)(l_0_0.ppid, MpCommon.WTSIsRemoteSession)
do
  if l_0_1 then
    local l_0_2 = (MpCommon.QuerySessionInformation)(l_0_0.ppid, MpCommon.WTSClientAddress)
    ;
    (bm.add_related_string)("bmurl", l_0_2.Address, bm.RelatedStringBMReport)
    TrackAttackerServer(l_0_2.Address)
  end
  return mp.INFECTED
end

