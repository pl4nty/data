-- Threat: !InfrastructureShared
-- Name: e18fc4567183
-- Type: 21

if mp.IsHipsRuleEnabled("92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B") then
  local l_0_0 = mp.getfilename()
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = string.match(l_0_0, "(.*)%.(%a+)->%w+/%w+.bin$")
  if l_0_1 == nil or l_0_2 == nil then
    l_0_1 = l_0_0
  else
    l_0_1 = l_0_1 .. "." .. l_0_2
  end
  if mp.get_mpattribute("ASRWin32ApiMacroExclusion") == true then
    return mp.CLEAN
  end
  if l_0_2 == "zip" then
    local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_3 == nil or l_0_3 == "" then
      return mp.CLEAN
    end
    l_0_3 = string.lower(l_0_3)
    if l_0_3 == "explorer.exe" then
      return mp.CLEAN
    end
  end
  mp.set_mpattribute("MpDisableCaching")
  MpCommon.AppendPersistContext(l_0_1, "enghipscpy:MHSTRLoadWin32importsfromMacroInside", 0)
end
return mp.INFECTED
