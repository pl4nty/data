-- Threat: !InfrastructureShared
-- Name: 44cb3f023685f
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

local l_0_0 = ""
if this_sigattrlog[16] ~= nil and this_sigattrlog[16].matched then
  local l_0_1 = this_sigattrlog[16].utf8p2 or ""
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "*", 1, true) then
    l_0_0 = "trustedhosts_registry_wildcard"
  else
    l_0_0 = "trustedhosts_registry_modify"
  end
  bm.add_related_string("WinRMCfg_reason", l_0_0, bm.RelatedStringBMReport)
  bm.add_related_string("WinRMCfg_regval", l_0_1, bm.RelatedStringBMReport)
  WinRMSessionTrackProcess("BM", nil, "Listener")
  mp.set_mpattribute("Lua:ContextDataProcess/WinRMSessionProcess.A")
  TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMConfig")
  add_parents()
  return mp.INFECTED
end
local l_0_2 = bm.get_current_process_startup_info()
if isnull(l_0_2) or not l_0_2.command_line then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.command_line or "")
local l_0_4 = bm.get_imagepath()
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_4)
if string.find(l_0_5, "\\windows defender\\", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_3, "trustedhosts", 1, true) then
  if string.find(l_0_3, "\"*\"", 1, true) or string.find(l_0_3, "'*'", 1, true) or string.find(l_0_3, "value *", 1, true) or string.find(l_0_3, "=\"*\"", 1, true) then
    l_0_0 = "trustedhosts_wildcard"
  else
    l_0_0 = "trustedhosts_modify"
  end
elseif string.find(l_0_3, "enable-psremoting", 1, true) and string.find(l_0_3, "-force", 1, true) then
  l_0_0 = "psremoting_force"
elseif string.find(l_0_3, "allowunencrypted", 1, true) and string.find(l_0_3, "true", 1, true) then
  l_0_0 = "unencrypted_allow"
elseif string.find(l_0_3, "basic", 1, true) and string.find(l_0_3, "true", 1, true) and string.find(l_0_3, "auth", 1, true) then
  l_0_0 = "basic_auth_enable"
elseif string.find(l_0_3, "quickconfig", 1, true) and string.find(l_0_3, "-force", 1, true) then
  l_0_0 = "quickconfig_force"
elseif string.find(l_0_3, "create", 1, true) and string.find(l_0_3, "listener", 1, true) then
  l_0_0 = "listener_create"
end
if l_0_0 == "" then
  return mp.CLEAN
end
bm.add_related_string("WinRMCfg_reason", l_0_0, bm.RelatedStringBMReport)
bm.add_related_string("WinRMCfg_cmd", l_0_3, bm.RelatedStringBMReport)
WinRMSessionTrackProcess("BM", nil, "Listener")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMSessionProcess.A")
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMConfig")
add_parents()
return mp.INFECTED
