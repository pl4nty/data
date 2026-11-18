-- Threat: !InfrastructureShared
-- Name: !#SLF:SystemDropUnsignedDL
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if peattributes.isdamaged then
  return mp.CLEAN
end
if not peattributes.no_security then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
  if l_0_0 == 4 then
    local l_0_1, l_0_2
    if MpCommon.GetPersistContextCountNoPath("RDPSettings") > 0 then
      local l_0_3 = MpCommon.GetPersistContextNoPath("RDPSettings")
      for l_0_4, l_0_5 in ipairs(l_0_3) do
        l_0_1, l_0_2 = string.match(l_0_5, "UA=([%d]+);SL=([%d]+)")
        if l_0_1 ~= nil then
          l_0_1 = tonumber(l_0_1)
          l_0_2 = tonumber(l_0_2)
          break
        end
      end
    else
      local l_0_6 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\Terminal Services")
      local l_0_7
      if l_0_6 then
        l_0_1 = sysio.GetRegValueAsDword(l_0_6, "UserAuthentication")
        if l_0_1 == nil then
          l_0_7 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp")
          if l_0_7 then
            l_0_1 = sysio.GetRegValueAsDword(l_0_7, "UserAuthentication")
          end
        end
        l_0_2 = sysio.GetRegValueAsDword(l_0_6, "SecurityLayer")
        if l_0_2 == nil then
          if l_0_7 == nil then
            l_0_7 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp")
          end
          if l_0_7 then
            l_0_2 = sysio.GetRegValueAsDword(l_0_7, "SecurityLayer")
          end
        end
      end
      local l_0_8 = {}
      l_0_8.UserAuthentication = l_0_1
      local l_0_9 = "UA=" .. l_0_1 .. ";SL=" .. l_0_2
      table.insert(l_0_8, l_0_9)
      MpCommon.SetPersistContextNoPath("RDPSettings", l_0_8, 3600)
    end
    if l_0_1 == 1 then
      return mp.CLEAN
    elseif l_0_2 == 0 then
      return mp.CLEAN
    end
    if mp.IsTrustedFile(false) == true then
      return mp.CLEAN
    end
    local l_0_10 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
    if l_0_10 ~= nil then
      local l_0_11 = MpCommon.PathToWin32Path(l_0_10)
      if l_0_11 == nil then
        return mp.CLEAN
      end
      local l_0_12 = {
        [":\\windows\\softwaredistribution"] = 1,
        [":\\windows\\assembly\\nativeimage"] = 1,
        [":\\program files\\cisco\\amp\\tmp\\"] = 1,
        [":\\windows\\carbonblack\\store\\tm"] = 1,
        [":\\program files (x86)\\trend mi"] = 1,
        [":\\program files\\trend\\sprotect"] = 1,
        [":\\$windows.~bt\\newos\\windows\\w"] = 1,
        [":\\windows\\winsxs\\temp\\inflight"] = 1,
        [":\\build_drop\\3ebuilddrop\\build"] = 1,
        [":\\windows\\csc\\v2.0.6\\namespace"] = 1,
        [":\\program files (x86)\\bmw\\ispi"] = 1,
        [":\\program files\\sourcefire\\fir"] = 1,
        [":\\programdata\\origin\\selfupdat"] = 1,
        [":\\program files\\microsoft dyna"] = 1,
        [":\\program files\\matlab\\r2019a\\"] = 1
      }
      if 30 < #l_0_11 then
        local l_0_13 = string.sub(l_0_11, 2, 31):lower()
        if l_0_12[l_0_13] or string.find(l_0_13, "\\$windows.~bt\\", 1, true) then
          return mp.CLEAN
        end
      end
      if not MpCommon.QueryPersistContext(l_0_10, "SystemDrop") then
        MpCommon.AppendPersistContext(l_0_10, "SystemDrop", 600)
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
