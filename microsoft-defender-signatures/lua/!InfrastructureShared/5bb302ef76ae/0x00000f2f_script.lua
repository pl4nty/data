-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb302ef76ae\0x00000f2f_luac 

-- params : ...
-- function num : 0
if IsTacticObservedGlobal("FirstLogonUser") then
  reportSessionInformation()
  addOverallNetworkVolume()
  return mp.INFECTED
end
return mp.CLEAN

