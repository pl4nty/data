-- Threat: !InfrastructureShared
-- Name: 5d8f1f3f2432
-- Type: 21

if mp.IsHipsRuleEnabled("d4f940ab-401b-4efc-aadc-ad5f3c50688a") then
  mp.set_mpattribute("MpDisableCaching")
  local l_0_0 = mp.getfilename()
  local l_0_1, l_0_2 = string.match(l_0_0, "(.*)%.(%a+)->%w+/%w+.bin$")
  if l_0_1 == nil or l_0_2 == nil then
    l_0_1 = l_0_0
  else
    l_0_1 = l_0_1 .. "." .. l_0_2
  end
  if sysio.IsFileExists(MpCommon.PathToWin32Path(l_0_1)) then
    MpCommon.AppendPersistContext(l_0_1, "enghipscpy:MHSTRCreateScheduledTaskFromMacro", 0)
  end
end
return mp.INFECTED
