-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db38c50ff73\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = (this_sigattrlog[2]).utf8p2
    bm_AddRelatedFileFromCommandLine(l_0_0)
    return mp.INFECTED
  end
  return mp.CLEAN
end

