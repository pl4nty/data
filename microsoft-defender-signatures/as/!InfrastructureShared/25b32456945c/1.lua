-- Threat: !InfrastructureShared
-- Name: 25b32456945c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = MpCommon.GetPersistContextNoPath("vssamsipid")
for l_0_1, l_0_2 in ipairs(l_0_0) do
  sms_untrusted_process_pid(l_0_2)
  add_parents(l_0_2)
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN
