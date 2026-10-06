-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAHVARoleXplat\1.luac 

-- params : ...
-- function num : 0
if GetRollingQueue("ExtendedHvaDeviceProperties") ~= nil then
  return mp.CLEAN
end
if (mp.get_mpattribute)("Lua:ZimbraMailServer") then
  local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  if l_0_0 == nil or #l_0_0 < 4 then
    return mp.CLEAN
  end
  local l_0_1 = "/opt/zimbra/"
  if l_0_0 and (string.sub)(l_0_0, 1, #l_0_1) == l_0_1 then
    RegisterHvaDeviceRole("ZimbraMailServer")
  end
else
  do
    if (mp.get_mpattribute)("Lua:SambaAD") then
      local l_0_2 = nil
      local l_0_3 = "(?i)/samba_dnsupdate|samba: task\\[|samba --foreground"
      local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
      if l_0_4 ~= nil then
        l_0_2 = (mp.GetProcessCommandLine)(l_0_4)
      end
      if l_0_2 then
        local l_0_5, l_0_6 = (MpCommon.StringRegExpSearch)(l_0_3, l_0_2)
        if l_0_5 then
          RegisterHvaDeviceRole("SambaActiveDirectory")
        end
      end
    end
    do
      return mp.CLEAN
    end
  end
end

