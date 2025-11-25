-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAICEBreakerOFN\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattributesubstring)("SLF:Backdoor:Win32/FrostByte") == nil then
  return mp.CLEAN
end
if (mp.get_mpattributesubstring)("Lua:PeProductName!icebreaker") == nil then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
;
(MpCommon.SetOriginalFileName)(l_0_0, "BM_ICEBreaker")
return mp.INFECTED

