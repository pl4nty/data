-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\85b3e6c54368\1.luac 

-- params : ...
-- function num : 0
if IsSharepointServer() then
  return mp.INFECTED
end
return mp.CLEAN

