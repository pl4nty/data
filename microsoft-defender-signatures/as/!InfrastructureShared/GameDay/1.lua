-- Threat: !InfrastructureShared
-- Name: GameDay
-- Type: 1

local function l_0_0(l_1_0)
  local l_1_1 = sysio.RegOpenKey(l_1_0)
  
  local l_1_2 = 0
  if l_1_1 then
    local l_1_3 = sysio.RegEnumKeys(l_1_1)
    for l_1_4, l_1_5 in pairs(l_1_3) do
      if l_1_5 then
        local l_1_6 = sysio.RegOpenKey(l_1_0 .. "\\\\" .. l_1_5)
        if l_1_6 then
          local l_1_7 = sysio.GetRegValueAsDword(l_1_6, "12000030")
          if l_1_7 and mp.bitand(l_1_7, 255) ~= 0 and mp.bitand(l_1_7, 16711680) ~= 0 and mp.bitand(l_1_7, 4278255360) == 0 then
            MpCommon.SetGlobalMpAttribute("GameDayRegKey")
            MpDetection.ScanResource("regkeyvalue://" .. l_1_0 .. "\\" .. l_1_5 .. "\\\\12000030")
            MpCommon.DeleteGlobalMpAttribute("GameDayRegKey")
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

function Infrastructure_ScanGameDay()
  l_0_0("HKLM\\BCD00000000\\Objects")
  SetLuaInstrLimit(crypto.shl64(1, 24))
  local l_2_0 = sysio.RegExpandUserKey("HKCU\\BCD00000000\\Objects")
  local l_2_1 = 0
  for l_2_2, l_2_3 in pairs(l_2_0) do
    l_0_0(l_2_3)
    l_2_1 = l_2_1 + 1
    if l_2_1 == 8 then
      break
    end
  end
  SetLuaInstrLimit(crypto.shl64(1, 24))
end
