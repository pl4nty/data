-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51b36eb5158f\1.luac 

-- params : ...
-- function num : 0
if IsLegacyOrgMachine() then
  return mp.CLEAN
end
AddResearchData("BM", true)
return mp.INFECTED

