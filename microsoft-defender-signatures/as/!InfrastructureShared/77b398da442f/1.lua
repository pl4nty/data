-- Threat: !InfrastructureShared
-- Name: 77b398da442f
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.len(l_0_0) >= 15 then
  local l_0_1 = {
    ["services.exe"] = true,
    ["msmpeng.exe"] = true,
    ["trustedinstaller.exe"] = true,
    ["tiworker.exe"] = true,
    ["poqexec.exe"] = true,
    ["svchost.exe"] = true,
    ["mbamservice.exe"] = true,
    ["core.exe"] = true,
    ["instup.exe"] = true,
    ["tguard.exe"] = true,
    ["nortonsecurity.exe"] = true,
    ["mfehidin.exe"] = true,
    ["mfeamcin.exe"] = true,
    ["avp.exe"] = true,
    ["v3medic.exe"] = true,
    ["vpninstaller.exe"] = true,
    ["waappagent.exe"] = true,
    ["handle64.exe"] = true,
    ["procexp64.exe"] = true,
    ["qhactivedefense.exe"] = true,
    ["qhsafetray.exe"] = true,
    ["computerztray.exe"] = true,
    ["avira.servicehost.exe"] = true,
    ["zhudongfangyu.exe"] = true,
    ["360tray.exe"] = true,
    ["qqpctray.exe"] = true,
    ["qqpcrtp.exe"] = true,
    ["kxecore.exe"] = true,
    ["kxetray.exe"] = true,
    ["fabrichost.exe"] = true
  }
  local l_0_2 = l_0_0:match("\\([^\\]+)$")
  if l_0_2 ~= nil then
    l_0_2 = string.lower(l_0_2)
    if l_0_1[l_0_2] then
      return mp.CLEAN
    end
  end
end
local l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_3:find("\\windowsazure\\.-\\waappagent.exe") then
  return mp.CLEAN
elseif l_0_3:find("\\windowsazure.-\\windowsazurenetagent.exe") then
  return mp.CLEAN
elseif l_0_3:find("system32\\drivers\\mbamswissarmy.sys") then
  return mp.CLEAN
elseif l_0_3:find("symantec shared\\eengine\\eraserutildrv11821.sys") then
  return mp.CLEAN
elseif l_0_3:find("system32\\drivers\\kbasemgr.sys") then
  return mp.CLEAN
elseif l_0_3:find("system32\\drivers\\kbasesrv.sys") then
  return mp.CLEAN
elseif l_0_3:find("system32\\drivers\\kisknl.sys") then
  return mp.CLEAN
elseif l_0_3:find("system32\\drivers\\kavbootc64_ev.sys") then
  return mp.CLEAN
end
if l_0_3 ~= nil then
  local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_3)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
    if sysio.IsFileExists(l_0_6) then
      bm.add_related_file(l_0_6)
    end
  end
end
TrackPidAndTechniqueBM("BM", "T1543.003", "service_reg_modified_b")
return mp.INFECTED
