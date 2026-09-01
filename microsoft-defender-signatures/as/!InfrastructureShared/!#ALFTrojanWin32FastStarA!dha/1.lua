-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32FastStarA!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
do
  if l_0_0 ~= nil and ((string.sub)(l_0_0, -11)):lower() == "patched.fmg" then
    local l_0_1 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
    if l_0_1 ~= nil and (sysio.IsFileExists)(l_0_1) then
      (mp.ReportLowfi)(l_0_1, 1450765366)
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

