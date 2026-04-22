-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\97b3ae9457b9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 and ((string.find)(l_0_0, "/chrome_crashpad_handler", 1, true) or (string.find)(l_0_0, "/galaxy-services/", 1, true)) then
  return mp.CLEAN
end
TerminateParentProcessForLinux()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
return mp.INFECTED

