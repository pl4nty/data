-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7f78ff7024ef\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetHSTRCallerId)()
if l_0_0 == nil then
  return mp.CLEAN
end
if mp.HSTR_CALLER_SMS == l_0_0 then
  reportDetectedRegions()
  return mp.INFECTED
end
;
(mp.set_mpattribute)("SLF:Win64/BruterShell.A")
return mp.LOWFI

