-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51b38dcd9289\1.luac 

-- params : ...
-- function num : 0
if IsLegacyOrgMachine() then
  return mp.CLEAN
end
bm_AddRelatedFileFromCommandLine("BM", nil, nil, 6)
return mp.INFECTED

