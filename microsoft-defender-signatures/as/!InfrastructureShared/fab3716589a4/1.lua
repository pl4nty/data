-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\fab3716589a4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.CLEAN
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 then
  l_0_0 = reportGenericRansomware((this_sigattrlog[4]).utf8p2)
else
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 then
    l_0_0 = reportGenericRansomware((this_sigattrlog[5]).utf8p2)
  end
end
if l_0_0 == mp.INFECTED then
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN

