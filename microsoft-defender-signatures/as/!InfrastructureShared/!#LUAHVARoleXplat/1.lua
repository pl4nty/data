-- Threat: !InfrastructureShared
-- Name: !#LUA:HVARoleXplat
-- Type: 13
-- Includes: LuaFuncHelper, HvaLookupHelpers
-- MpAttributes: (Lua:ZimbraMailServer | Lua:SambaAD | Lua:OktaAgent | Lua:Linux:ProcName_java | Lua:SAPAgent)

if GetRollingQueue("ExtendedHvaDeviceProperties") ~= nil then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:ZimbraMailServer") then
  RegisterHvaDeviceRole("ZimbraMailServer")
elseif mp.get_mpattribute("Lua:SambaAD") then
  local l_0_2 = "(?i)/samba_dnsupdate|samba: task\\[|samba --foreground"
  local l_0_3, l_0_4 = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
  if l_0_3 then
    RegisterHvaDeviceRole("SambaActiveDirectory")
  end
elseif mp.get_mpattribute("Lua:OktaAgent") then
  if string.find(l_0_1, "OktaLDAPAgent.jar", 1, true) or string.find(l_0_1, "OktaProvisioningAgent.jar", 1, true) then
    RegisterHvaDeviceRole("OktaAuthAgent")
  end
elseif mp.get_mpattribute("Lua:SAPAgent") then
  RegisterHvaDeviceRole("SAPSuite")
elseif mp.get_mpattribute("Lua:Linux:ProcName_java") then
  if string.find(l_0_1, "-Dkc.home.dir=", 1, true) and string.find(l_0_1, "/keycloak/", 1, true) then
    RegisterHvaDeviceRole("KeyCloakIAM")
  elseif string.find(l_0_1, "glassfish.jar", 1, true) and string.find(l_0_1, "-Dorg.glassfish.", 1, true) then
    RegisterHvaDeviceRole("EclipseGlassFish")
  elseif string.find(l_0_1, "-Dsolr.solr.home", 1, true) then
    RegisterHvaDeviceRole("ApacheSolr")
  elseif string.find(l_0_1, "-Datlassian.", 1, true) then
    RegisterHvaDeviceRole("AtlassianSuite")
  elseif string.find(l_0_1, "jboss-modules.jar", 1, true) or string.find(l_0_1, "-Djboss.home.dir", 1, true) or string.find(l_0_1, "org.jboss.Main", 1, true) or string.find(l_0_1, "org.jboss.as.standalone", 1, true) then
    RegisterHvaDeviceRole("JbossWildfly")
  elseif string.find(l_0_1, "weblogic.Server", 1, true) or string.find(l_0_1, "-Dweblogic.Name", 1, true) or string.find(l_0_1, "com.oracle.classloader.weblogic", 1, true) or string.find(l_0_1, "-Dweblogic.RootDirectory", 1, true) then
    RegisterHvaDeviceRole("OracleWeblogic")
  elseif string.find(l_0_1, "org.eclipse.jetty.start.Main", 1, true) or string.find(l_0_1, "-Djetty.home", 1, true) or string.find(l_0_1, "-Djetty.base", 1, true) then
    RegisterHvaDeviceRole("EclipseJetty")
  elseif string.find(l_0_1, "jetbrains.buildServer.agent.AgentMain", 1, true) or string.find(l_0_1, "-Dteamcity.configuration.path", 1, true) then
    RegisterHvaDeviceRole("TeamCity")
  end
end
return mp.CLEAN
