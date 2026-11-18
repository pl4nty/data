-- Threat: !InfrastructureShared
-- Name: a57885a79b72
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
if mp.GetSMSProcArchitecture() ~= mp.SMS_PROC_ARCH_X64 then
  return mp.CLEAN
end
return mp.INFECTED
