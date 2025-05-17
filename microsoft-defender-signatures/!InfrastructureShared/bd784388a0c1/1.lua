-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bd784388a0c1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetHSTRCallerId)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  return mp.INFECTED
end
;
(mp.set_mpattribute)("SLF:Trojan:Win32/SusHWBP.Gracing.AK")
return mp.LOWFI

