-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6cec_237.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_exports_count)()
if peattributes.isdll == true and (l_0_0 == 10 or l_0_0 == 11) then
  return mp.INFECTED
end
return mp.CLEAN

