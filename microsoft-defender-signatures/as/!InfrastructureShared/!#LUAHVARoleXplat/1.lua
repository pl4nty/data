-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAHVARoleXplat\1.luac 

-- params : ...
-- function num : 0
if GetRollingQueue("ExtendedHvaDeviceProperties") ~= nil then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if (mp.get_mpattribute)("Lua:ZimbraMailServer") then
  RegisterHvaDeviceRole("ZimbraMailServer")
else
  if (mp.get_mpattribute)("Lua:SambaAD") then
    local l_0_2 = "(?i)/samba_dnsupdate|samba: task\\[|samba --foreground"
    local l_0_3, l_0_4 = (MpCommon.StringRegExpSearch)(l_0_2, l_0_1)
    if l_0_3 then
      RegisterHvaDeviceRole("SambaActiveDirectory")
    end
  else
    do
      if (mp.get_mpattribute)("Lua:OktaAgent") and ((string.find)(l_0_1, "OktaLDAPAgent.jar", 1, true) or (string.find)(l_0_1, "OktaProvisioningAgent.jar", 1, true)) then
        RegisterHvaDeviceRole("OktaAuthAgent")
      end
      if (mp.get_mpattribute)("Lua:Linux:ProcName_java") then
        if (string.find)(l_0_1, "-Dkc.home.dir=", 1, true) and (string.find)(l_0_1, "/keycloak/", 1, true) then
          RegisterHvaDeviceRole("KeyCloakIAM")
        else
          if (string.find)(l_0_1, "-Dsolr.solr.home", 1, true) then
            RegisterHvaDeviceRole("ApacheSolr")
          else
            if (string.find)(l_0_1, "-Datlassian.", 1, true) then
              RegisterHvaDeviceRole("AtlassianSuite")
            else
              if (string.find)(l_0_1, "jboss-modules.jar", 1, true) or (string.find)(l_0_1, "-Djboss.home.dir", 1, true) or (string.find)(l_0_1, "org.jboss.Main", 1, true) or (string.find)(l_0_1, "org.jboss.as.standalone", 1, true) then
                RegisterHvaDeviceRole("JbossWildfly")
              else
                if (string.find)(l_0_1, "weblogic.Server", 1, true) or (string.find)(l_0_1, "-Dweblogic.Name", 1, true) or (string.find)(l_0_1, "com.oracle.classloader.weblogic", 1, true) or (string.find)(l_0_1, "-Dweblogic.RootDirectory", 1, true) then
                  RegisterHvaDeviceRole("OracleWeblogic")
                else
                  if (string.find)(l_0_1, "org.apache.catalina.startup.Bootstrap", 1, true) or (string.find)(l_0_1, "-Dcatalina.home", 1, true) then
                    RegisterHvaDeviceRole("ApacheTomcat")
                  else
                    if (string.find)(l_0_1, "org.eclipse.jetty.start.Main", 1, true) or (string.find)(l_0_1, "-Djetty.home", 1, true) or (string.find)(l_0_1, "-Djetty.base", 1, true) then
                      RegisterHvaDeviceRole("EclipseJetty")
                    end
                  end
                end
              end
            end
          end
        end
      end
      return mp.CLEAN
    end
  end
end

