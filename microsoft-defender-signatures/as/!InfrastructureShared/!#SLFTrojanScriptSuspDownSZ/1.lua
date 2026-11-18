-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Script/SuspDown.SZ
-- Type: 13
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: MpPowershellAmsiViaCmdLine

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_3 and l_0_4 ~= nil and string.find(l_0_4, "\\powershell.exe", 1, true) then
      local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
      if not l_0_5 then
        return mp.CLEAN
      end
      local l_0_6 = mp.getfilesize()
      if 450 < l_0_6 then
        return mp.CLEAN
      end
      local l_0_7 = mp.GetProcessCommandLine(l_0_5)
      if not l_0_7 then
        return mp.CLEAN
      end
      l_0_7 = string.lower(l_0_7)
      if #l_0_7 < 50 then
        return mp.CLEAN
      end
      if 450 < #l_0_7 then
        return mp.CLEAN
      end
      local l_0_8, l_0_9 = extract_urls(l_0_7)
      if isnull(l_0_9) then
        return mp.CLEAN
      end
      for l_0_10, l_0_11 in ipairs(l_0_9) do
        local l_0_12 = split(l_0_11, "%.")
        if not l_0_12 then
          return mp.CLEAN
        end
        local l_0_13 = "." .. tostring(l_0_12[#l_0_12])
        if not l_0_13 then
          return mp.CLEAN
        end
        if isSuspTLD(l_0_13) then
          local l_0_14 = mp.GetParentProcInfo(l_0_5)
          if l_0_14 ~= nil and l_0_14.image_path ~= nil then
            local l_0_15 = string.lower(l_0_14.image_path)
            local l_0_16 = l_0_15:match("([^\\]+)$")
            local l_0_17 = {
              ["explorer.exe"] = true,
              ["powershell.exe"] = true,
              ["cmd.exe"] = true
            }
            if l_0_17[l_0_16] then
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
