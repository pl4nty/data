-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7fde_274.luac 

-- params : ...
-- function num : 0
if (mp.GetHSTRCallerId)() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
if (mp.GetSMSProcArchitecture)() ~= mp.SMS_PROC_ARCH_X64 then
  return mp.CLEAN
end
return mp.INFECTED

