-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanPowerShellSuspiciousPSCommandB\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_AMSI then
  if pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME) and pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME) and mp.get_contextdata == nil then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN

