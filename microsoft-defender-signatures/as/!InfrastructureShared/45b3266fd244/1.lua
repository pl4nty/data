-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45b3266fd244\1.luac 

-- params : ...
-- function num : 0
if ((reportSessionInformation()).Session).ClientProtocolType == 2 then
  return mp.INFECTED
end
return mp.CLEAN

