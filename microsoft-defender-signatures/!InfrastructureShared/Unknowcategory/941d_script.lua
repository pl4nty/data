-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\941d_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 and (string.find)((string.lower)(l_0_0), "\\servicing\\packages\\microsoft%-windows%-client%-desktop%-required%-package.+%.mum") then
  (mp.set_mpattribute)("SelectableWinDefendPkgInServicing")
end
return mp.CLEAN

