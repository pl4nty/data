-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7fdc_275.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("MpInternal_IsPliScan") then
  return mp.INFECTED
end
local l_0_0 = (mp.GetHSTRCallerId)()
if l_0_0 ~= nil and l_0_0 == mp.HSTR_CALLER_SMS then
  return mp.INFECTED
end
return mp.CLEAN

