-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\101b38977c075\0x00000e7a_luac 

-- params : ...
-- function num : 0
if IsExchangeServer() then
  return mp.INFECTED
end
return mp.CLEAN

