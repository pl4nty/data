-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b37c27057e\1.luac 

-- params : ...
-- function num : 0
if IsADConnectRole() then
  return mp.INFECTED
end
return mp.CLEAN

