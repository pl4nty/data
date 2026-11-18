-- Threat: !InfrastructureShared
-- Name: c27808f7dc47
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
if mp.GetSMSProcArchitecture() ~= mp.SMS_PROC_ARCH_X32 then
  return mp.CLEAN
end
return mp.INFECTED
