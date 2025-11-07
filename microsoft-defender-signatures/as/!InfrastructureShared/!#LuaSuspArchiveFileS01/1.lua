-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSuspArchiveFileS01\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 and (string.lower)(l_0_1) == "firefox.exe" then
    (mp.set_mpattribute)("MpDisableCaching")
    local l_0_2 = (mp.getfilesize)()
    if l_0_2 < 1000 then
      (mp.set_mpattribute)("MpForceScanArchives")
    end
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

