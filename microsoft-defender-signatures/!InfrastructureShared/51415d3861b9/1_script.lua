-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51415d3861b9\1_luac 

-- params : ...
-- function num : 0
if isPublicIP((this_sigattrlog[3]).utf8p1) then
  return mp.INFECTED
end
return mp.CLEAN

