-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextDataProcessName3
-- Type: 12

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_AMSI then
  local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_0 and l_0_1 ~= nil then
    mp.set_mpattribute("Lua:AmsiAppContextData:File:" .. l_0_1)
    if l_0_1:find("%.psd1$") or l_0_1:find("%.psm1$") then
      mp.set_mpattribute("Lua:AmsiAppContextData:File:PsModule")
      return mp.CLEAN
    end
  end
  local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_2 and l_0_3 ~= nil then
    mp.set_mpattribute("Lua:AmsiAppContextDataPresent")
    mp.set_mpattribute("Lua:AmsiAppContextData:Proc:" .. l_0_3)
    local l_0_4 = string.lower(l_0_3)
    if string.find(l_0_4, "^powershell_") and not string.find(l_0_4, ":\\windows\\sys", 1, true) and not string.find(l_0_4, ":\\program files", 1, true) and not string.find(l_0_4, "\\powershell.exe", 1, true) and not string.find(l_0_4, "\\pwsh.exe", 1, true) then
      mp.set_mpattribute("Lua:AmsiAppIdNonStandard")
      local l_0_5, l_0_6 = string.match(l_0_4, "([^\\]+%.exe)_(.+)")
      if l_0_5 and l_0_6 then
        l_0_5 = l_0_5:gsub("%s", "/x20")
        mp.set_mpattribute("Lua:AmsiAppExeName!" .. l_0_5)
        local l_0_7 = string.find(l_0_6, "(1[01]%.%d%.%d%d%d%d%d%.%d+)")
        if l_0_7 then
          mp.set_mpattribute("Lua:AmsiAppIdNonStandardPSv1")
          local l_0_8 = l_0_4:gsub("%s", "/x20")
          l_0_8 = string.gsub(l_0_8, "^powershell_", "")
          l_0_8 = string.match(l_0_8, "(.+\\)")
          local l_0_9 = string.gmatch(l_0_8, "[^\\]+")
          local l_0_10 = 0
          for l_0_11 in l_0_9, nil, nil do
            local l_0_12 = string.format("%s%s!%s", "Lua:AmsiAppIdFolder", tostring(l_0_10), l_0_11)
            mp.set_mpattribute(l_0_12)
            l_0_10 = l_0_10 + 1
            if 6 <= l_0_10 then
              break
            end
          end
        end
      end
      local l_0_13 = mp.getfilesize()
      if l_0_13 <= 5120 then
        mp.set_mpattribute("Lua:AmsiSizeLE5KB")
      elseif l_0_13 <= 10240 then
        mp.set_mpattribute("Lua:AmsiSizeLE10KB")
      elseif l_0_13 <= 51200 then
        mp.set_mpattribute("Lua:AmsiSizeLE50KB")
      elseif l_0_13 <= 102400 then
        mp.set_mpattribute("Lua:AmsiSizeLE100KB")
      elseif l_0_13 <= 512000 then
        mp.set_mpattribute("Lua:AmsiSizeLE500KB")
      elseif l_0_13 <= 1048576 then
        mp.set_mpattribute("Lua:AmsiSizeLE1MB")
      else
        mp.set_mpattribute("Lua:AmsiSizeGT1MB")
      end
    end
  end
  local l_0_14 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_14 ~= nil then
    local l_0_15 = MpCommon.GetImagePathFromPid(l_0_14)
    if l_0_15 then
      local l_0_16 = string.match(l_0_15, "([^\\]+)$")
      if l_0_16 then
        mp.set_mpattribute("Lua:AmsiAppContextData:ProcName:" .. string.lower(l_0_16))
      end
    end
    local l_0_17 = mp.GetParentProcInfo(l_0_14)
    if l_0_17 ~= nil and l_0_17.image_path ~= nil then
      local l_0_18 = string.lower(string.match(l_0_17.image_path, "([^\\]+)$"))
      if l_0_18 ~= nil then
        mp.set_mpattribute("Lua:AmsiAppContextData:Parent!" .. l_0_18)
        local l_0_19 = mp.GetParentProcInfo(l_0_17.ppid)
        if l_0_19 ~= nil and l_0_19.image_path ~= nil then
          local l_0_20 = string.lower(string.match(l_0_19.image_path, "([^\\]+)$"))
          if l_0_20 ~= nil then
            mp.set_mpattribute("Lua:AmsiAppContextData:GParent!" .. l_0_20)
          end
        end
      end
    end
  end
end
return mp.CLEAN
