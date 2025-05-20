-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6049_212.luac 

-- params : ...
-- function num : 0
if mp.HSTR_WEIGHT == 101 then
  return mp.INFECTED
else
  if mp.HSTR_WEIGHT > 199 then
    return mp.SUSPICIOUS
  end
end
return mp.CLEAN

