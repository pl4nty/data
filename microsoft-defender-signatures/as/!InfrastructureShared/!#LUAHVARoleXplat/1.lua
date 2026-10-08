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
      if (mp.get_mpattribute)("Lua:Linux:ProcName_java") and (string.find)(l_0_1, "-Dkc.home.dir=", 1, true) and (string.find)(l_0_1, "/keycloak/", 1, true) then
        RegisterHvaDeviceRole("KeyCloakIAM")
      end
      return mp.CLEAN
    end
  end
end

