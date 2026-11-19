-- Threat: !InfrastructureShared
-- Name: BlofeldCat
-- Type: 1

function Infrastructure_ScanBlofeldCatKeyPath(l_1_0)
  local l_1_1 = sysio.RegOpenKey(l_1_0)
  
  local l_1_2 = 0
  if l_1_1 then
    local l_1_3 = sysio.RegEnumKeys(l_1_1)
    for l_1_4, l_1_5 in pairs(l_1_3) do
      if l_1_5 then
        local l_1_6 = sysio.RegOpenKey(l_1_0 .. "\\\\" .. l_1_5)
        if l_1_6 then
          local l_1_7 = sysio.GetRegValueAsString(l_1_6, "UpgradeData")
          if l_1_7 and string.len(l_1_7) > 49 then
            MpCommon.SetGlobalMpAttribute("BlofeldCatRegKey")
            MpDetection.ScanResource("regkeyvalue://" .. l_1_0 .. "\\" .. l_1_5 .. "\\\\UpgradeData")
            MpCommon.DeleteGlobalMpAttribute("BlofeldCatRegKey")
          end
        end
      end
      l_1_2 = l_1_2 + 1
      if l_1_2 == 50 then
        SetLuaInstrLimit(crypto.shl64(1, 24))
        l_1_2 = 0
      end
    end
  end
end

function Infrastructure_ScanBlofeldCat()
  Infrastructure_ScanBlofeldCatKeyPath("HKLM\\Software\\Microsoft\\DRM")
  SetLuaInstrLimit(crypto.shl64(1, 24))
  local l_2_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\DRM")
  local l_2_1 = 0
  for l_2_2, l_2_3 in pairs(l_2_0) do
    Infrastructure_ScanBlofeldCatKeyPath(l_2_3)
    l_2_1 = l_2_1 + 1
    if l_2_1 == 8 then
      break
    end
  end
  SetLuaInstrLimit(crypto.shl64(1, 24))
end
