-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9f8_2463.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_AMSI then
  local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
  if l_0_0 and l_0_1 ~= nil then
    (mp.set_mpattribute)("Lua:AmsiAppContextData:File:" .. l_0_1)
    if l_0_1:find("%.psd1$") or l_0_1:find("%.psm1$") then
      (mp.set_mpattribute)("Lua:AmsiAppContextData:File:PsModule")
      return mp.CLEAN
    end
  end
  local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_2 and l_0_3 ~= nil then
    (mp.set_mpattribute)("Lua:AmsiAppContextDataPresent")
    ;
    (mp.set_mpattribute)("Lua:AmsiAppContextData:Proc:" .. l_0_3)
    local l_0_4 = (string.lower)(l_0_3)
    if (string.find)(l_0_4, "^powershell_") and not (string.find)(l_0_4, ":\\windows\\sys", 1, true) and not (string.find)(l_0_4, ":\\program files", 1, true) and not (string.find)(l_0_4, "\\powershell.exe", 1, true) and not (string.find)(l_0_4, "\\pwsh.exe", 1, true) then
      (mp.set_mpattribute)("Lua:AmsiAppIdNonStandard")
      local l_0_5, l_0_6 = (string.match)(l_0_4, "([^\\]+%.exe)_(.+)")
      if l_0_5 and l_0_6 then
        l_0_5 = l_0_5:gsub("%s", "/x20")
        ;
        (mp.set_mpattribute)("Lua:AmsiAppExeName!" .. l_0_5)
        local l_0_7 = (string.find)(l_0_6, "(1[01]%.%d%.%d%d%d%d%d%.%d+)")
        if l_0_7 then
          (mp.set_mpattribute)("Lua:AmsiAppIdNonStandardPSv1")
          local l_0_8 = l_0_4:gsub("%s", "/x20")
          l_0_8 = (string.gsub)(l_0_8, "^powershell_", "")
          l_0_8 = (string.match)(l_0_8, "(.+\\)")
          local l_0_9 = (string.gmatch)(l_0_8, "[^\\]+")
          local l_0_10 = 0
          for l_0_14 in l_0_9 do
            do
              do
                local l_0_15 = (string.format)("%s%s!%s", "Lua:AmsiAppIdFolder", tostring(l_0_10), l_0_14)
                ;
                (mp.set_mpattribute)(l_0_15)
                l_0_10 = l_0_10 + 1
                if l_0_10 >= 6 then
                  break
                end
                -- DECOMPILER ERROR at PC187: LeaveBlock: unexpected jumping out DO_STMT

              end
            end
          end
        end
      end
      l_0_7 = mp
      l_0_7 = l_0_7.getfilesize
      l_0_7 = l_0_7()
      local l_0_16 = nil
      if l_0_7 <= 5120 then
        l_0_8 = mp
        l_0_8 = l_0_8.set_mpattribute
        l_0_9 = "Lua:AmsiSizeLE5KB"
        l_0_8(l_0_9)
      else
        if l_0_7 <= 10240 then
          l_0_8 = mp
          l_0_8 = l_0_8.set_mpattribute
          l_0_9 = "Lua:AmsiSizeLE10KB"
          l_0_8(l_0_9)
        else
          if l_0_7 <= 51200 then
            l_0_8 = mp
            l_0_8 = l_0_8.set_mpattribute
            l_0_9 = "Lua:AmsiSizeLE50KB"
            l_0_8(l_0_9)
          else
            if l_0_7 <= 102400 then
              l_0_8 = mp
              l_0_8 = l_0_8.set_mpattribute
              l_0_9 = "Lua:AmsiSizeLE100KB"
              l_0_8(l_0_9)
            else
              if l_0_7 <= 512000 then
                l_0_8 = mp
                l_0_8 = l_0_8.set_mpattribute
                l_0_9 = "Lua:AmsiSizeLE500KB"
                l_0_8(l_0_9)
              else
                if l_0_7 <= 1048576 then
                  l_0_8 = mp
                  l_0_8 = l_0_8.set_mpattribute
                  l_0_9 = "Lua:AmsiSizeLE1MB"
                  l_0_8(l_0_9)
                else
                  l_0_8 = mp
                  l_0_8 = l_0_8.set_mpattribute
                  l_0_9 = "Lua:AmsiSizeGT1MB"
                  l_0_8(l_0_9)
                end
              end
            end
          end
        end
      end
    end
  end
  do
    l_0_4 = mp
    l_0_4 = l_0_4.get_contextdata
    l_0_5 = mp
    l_0_5 = l_0_5.CONTEXT_DATA_AMSI_OPERATION_PPID
    l_0_4 = l_0_4(l_0_5)
    local l_0_17 = nil
    if l_0_4 ~= nil then
      l_0_5 = mp
      l_0_5 = l_0_5.GetParentProcInfo
      l_0_6 = l_0_4
      l_0_5 = l_0_5(l_0_6)
      local l_0_18 = nil
      if l_0_5 ~= nil then
        l_0_6 = l_0_5.image_path
        if l_0_6 ~= nil then
          l_0_6 = string
          l_0_6 = l_0_6.lower
          l_0_7 = string
          l_0_7 = l_0_7.match
          l_0_17 = l_0_5.image_path
          l_0_18 = "([^\\]+)$"
          l_0_6 = l_0_6(l_0_7(l_0_17, l_0_18))
          local l_0_19 = nil
          if l_0_6 ~= nil then
            (mp.set_mpattribute)("Lua:AmsiAppContextData:Parent!" .. l_0_18)
            local l_0_20 = nil
            -- DECOMPILER ERROR at PC281: Overwrote pending register: R9 in 'AssignReg'

            -- DECOMPILER ERROR at PC282: Overwrote pending register: R9 in 'AssignReg'

            if (mp.GetParentProcInfo)(l_0_5.ppid) ~= nil and ((mp.GetParentProcInfo)(l_0_5.ppid)).image_path ~= nil then
              local l_0_21 = nil
              -- DECOMPILER ERROR at PC292: Overwrote pending register: R11 in 'AssignReg'

              if (string.lower)(l_0_18(l_0_19, l_0_20)) ~= nil then
                do
                  (mp.set_mpattribute)("Lua:AmsiAppContextData:GParent!" .. l_0_20)
                  -- DECOMPILER ERROR at PC295: Confused about usage of register R10 for local variables in 'ReleaseLocals'

                  l_0_0 = mp
                  l_0_0 = l_0_0.CLEAN
                  return l_0_0
                end
              end
            end
          end
        end
      end
    end
  end
end

