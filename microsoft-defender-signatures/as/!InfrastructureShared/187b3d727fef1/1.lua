-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\187b3d727fef1\1.luac 

-- params : ...
-- function num : 0
if IsActiveDirectoryRole() then
  return mp.INFECTED
end
return mp.CLEAN

