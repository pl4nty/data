-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93f5_350.luac 

-- params : ...
-- function num : 0
if ((mp.GetBruteMatchData)()).match_offset == 0 then
  if headerpage == nil then
    return mp.CLEAN
  end
  if (mp.readu_u32)(headerpage, 1) == 1497451600 and (mp.readu_u16)(headerpage, 5) == 2573 then
    return mp.INFECTED
  end
end
return mp.CLEAN

