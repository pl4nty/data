-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorWin32RemoteAdsyncAccessA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_ID) ~= 4 then
  return mp.CLEAN
end
if not IsADConnectRole() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
do
  if l_0_0:find("\\Data\\ADSync2019", 1, true) and l_0_1 == "ADSync.mdf" then
    local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_IP)
    if not l_0_2 or not l_0_3 or l_0_3 == "" then
      return mp.CLEAN
    end
    ;
    (mp.set_mpattribute)((string.format)("MpInternal_researchdata=RemoteAdsyncAccess=%s", l_0_3))
    return mp.INFECTED
  end
  return mp.CLEAN
end

