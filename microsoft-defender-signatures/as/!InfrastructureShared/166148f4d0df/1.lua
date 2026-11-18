-- Threat: !InfrastructureShared
-- Name: 166148f4d0df
-- Type: 21

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {}
for l_0_2, l_0_3 in ipairs(mp.enum_mpattributesubstring("")) do
  table.insert(l_0_1, l_0_3)
end
l_0_1 = table.concat(l_0_1, ";")
if l_0_1:find("Detection:", 1, true) then
  MpCommon.BmTriggerSig(l_0_0, "SmsNamedAttributes.A", l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
