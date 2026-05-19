-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUABlockCopiedSystoolASR\1.luac 

-- params : ...
-- function num : 0
if not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.IsHipsRuleEnabled)("c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb") then
  return mp.CLEAN
end
local l_0_1 = "enghipscpy:blockexecution:c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb"
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = (MpCommon.PathToWin32Path)(l_0_2)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if (mp.IsPathExcludedForHipsRule)(l_0_3, "c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb") then
  return mp.CLEAN
end
if (MpCommon.QueryPersistContext)(l_0_2, l_0_1) then
  if not (mp.IsHipsRuleEnabled)("c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb") then
    return mp.CLEAN
  end
  return mp.INFECTED
end
if l_0_0 == mp.SCANREASON_ONOPEN and not (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) and (mp.bitand)((mp.get_contextdata)(mp.CONTEXT_DATA_DESIREDACCESS), 32) ~= 32 then
  return mp.CLEAN
end
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_4 = (MpCommon.ExpandEnvironmentVariables)("%systemroot%")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = (MpCommon.PathToWin32Path)(l_0_4)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
if (string.find)(l_0_3, l_0_4, 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, ":\\$winreagent\\", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, ":\\mount[^\\]*\\windows\\winsxs\\temp\\pendingrenames\\") ~= nil then
  return mp.CLEAN
end
if (string.sub)(l_0_3, 2, 12) == ":\\$windows." then
  return mp.CLEAN
end
if (string.find)(l_0_3, ":\\windows.old\\", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, ":\\$sysreset\\", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find)(l_0_3, ":\\winpe\\windows\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_5 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%programfiles%"))
if l_0_5 ~= nil and (string.find)(l_0_3, l_0_5, 1, true) ~= nil then
  if (string.find)(l_0_3, ":\\program files\\windowsapps\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files\\git\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\java\\jre[^\\]*\\bin\\") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\java\\jdk[^\\]*\\bin\\") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\java\\jre[^\\]*\\bin\\") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files\\sharp\\file-copy\\robocopy.exe", 1, true) ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files\\wsl\\wsl.exe", 1, true) ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft onedrive\\standaloneupdater\\onedrivesetup.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft onedrive\\[%d%.]+\\onedrivesetup.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft onedrive\\update\\onedrivesetup.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft office\\root\\client\\appvdllsurrogate%d*%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft office\\updates\\download\\packagefiles\\[^\\]+\\root\\client\\appvdllsurrogate%d*%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\common files\\microsoft shared\\") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\") ~= nil then
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\extensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_3, ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\commonextensions\\microsoft\\") ~= nil then
      return mp.CLEAN
    end
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\wsl\\wslg.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\windows kits\\%d+\\app certification kit\\aitstatic.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\program files[^\\]*\\sophos\\endpoint defense\\sophosna.exe") ~= nil then
    return mp.CLEAN
  end
else
  if (string.find)(l_0_3, "\\appdata\\local\\microsoft\\onedrive\\standaloneupdater\\onedrivesetup.*%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, "\\appdata\\local\\microsoft\\onedrive\\update\\onedrivesetup.*%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, "\\appdata\\local\\microsoft\\onedrive\\[%d%.]+\\onedrivesetup.*%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\programdata\\microsoft\\grouppolicy\\users\\[^\\]+\\datastore\\0\\sysvol\\fcc%.intfcc%.local\\policies\\[^\\]+\\user\\[^\\]+\\logon\\bginfo%.exe") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\programdata\\docker\\windowsfilter\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\programdata\\dell\\saremediation\\systemrepair\\snapshots\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, ":\\programdata\\dell\\saremediation\\tempdrivers\\dell", 1, true) ~= nil then
    return mp.CLEAN
  end
end
local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
l_0_6 = (string.lower)(l_0_6)
if l_0_6 == "mpsigstub.exe" then
  if (string.find)(l_0_3, "[a-z]:\\{00000000%-0000%-0000%-0000%-000000000000}\\svroot\\windows\\temp\\[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, "[a-z]:\\program files[^\\]+\\tanium\\tanium client\\data\\temp\\[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, "[a-z]:\\users\\.+\\appdata\\local\\temp\\[%d\\]*[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$") ~= nil then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, "[a-z]:\\programdata\\microsoft\\windows defender\\platform\\[^\\]+\\mpsigstub%.exe$") ~= nil then
    return mp.CLEAN
  end
end
if l_0_6 == "klist.exe" and (string.find)(l_0_3, ":\\program files[^\\]*\\.+\\jre\\bin\\") ~= nil then
  return mp.CLEAN
end
local l_0_7 = false
local l_0_8 = {}
-- DECOMPILER ERROR at PC737: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC738: Overwrote pending register: R9 in 'AssignReg'

local l_0_9 = ((l_0_4 .. "\\system32\\").get_versioninfo)()
-- DECOMPILER ERROR at PC743: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC748: Overwrote pending register: R11 in 'AssignReg'

if l_0_9 ~= nil and l_0_4 .. "\\syswow64\\" ~= nil then
  local l_0_10 = ((string.lower)(l_0_4 .. "\\system32\\windowspowershell\\v1.0\\"))
  local l_0_11 = nil
  -- DECOMPILER ERROR at PC751: Overwrote pending register: R12 in 'AssignReg'

  l_0_11 = ((l_0_4 .. "\\syswow64\\windowspowershell\\v1.0\\").match)(l_0_10, "%.([^%.]+)$")
  if l_0_11 == nil then
    l_0_10 = l_0_10 .. ".exe"
    l_0_11 = "exe"
  end
  if l_0_11 == "exe" then
    do
      if (string.find)(l_0_10, "onedrivesetup.*%.exe") ~= nil then
        local l_0_13 = (mp.IsTrustedFile)(false)
        if l_0_13 == true then
          return mp.CLEAN
        end
      end
      local l_0_12 = 1
      for i = l_0_12, #l_0_8 do
        if not l_0_7 and (sysio.IsFileExists)(l_0_8[l_0_16] .. l_0_10) then
          l_0_7 = true
        end
      end
      -- DECOMPILER ERROR at PC797: Confused about usage of register R12 for local variables in 'ReleaseLocals'

      if not l_0_7 then
        l_0_10 = string
        l_0_10 = l_0_10.match
        l_0_11 = l_0_6
        l_0_10 = l_0_10(l_0_11, "(%.[^%.]+)$")
        if l_0_10 == ".exe" then
          l_0_10 = 1
          l_0_11 = #l_0_8
          for l_0_20 = l_0_10, l_0_11 do
            local l_0_19, l_0_20 = nil
            if not l_0_7 then
              l_0_19 = sysio
              l_0_19 = l_0_19.IsFileExists
              l_0_20 = l_0_8[l_0_18]
              l_0_20 = l_0_20 .. l_0_6
              l_0_19 = l_0_19(l_0_20)
              if l_0_19 then
                l_0_7 = true
              end
            end
          end
        end
      end
      do
        if not l_0_7 then
          local l_0_21 = nil
          if (MpCommon.GetOriginalFileName)(l_0_2) ~= nil and (MpCommon.GetOriginalFileName)(l_0_2) ~= "" then
            local l_0_22 = nil
            -- DECOMPILER ERROR at PC834: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC838: Overwrote pending register: R11 in 'AssignReg'

            -- DECOMPILER ERROR at PC841: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC842: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC845: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC846: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC847: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC852: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC853: Overwrote pending register: R13 in 'AssignReg'

            if nil ~= nil or l_0_21 == "exe" then
              for l_0_26 = l_0_21, l_0_22 do
                local l_0_25, l_0_26 = nil
                -- DECOMPILER ERROR at PC859: Overwrote pending register: R16 in 'AssignReg'

                -- DECOMPILER ERROR at PC862: Overwrote pending register: R17 in 'AssignReg'

                if not l_0_7 then
                  l_0_25 = l_0_25(l_0_26)
                  if l_0_25 then
                    l_0_7 = true
                  end
                end
              end
              -- DECOMPILER ERROR at PC868: Confused about usage of register R13 for local variables in 'ReleaseLocals'

            end
          end
        end
        if l_0_7 then
          local l_0_27 = l_0_22
          -- DECOMPILER ERROR at PC881: Overwrote pending register: R12 in 'AssignReg'

          if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) ~= nil and (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) ~= "" and (string.lower)(l_0_21) == "svchost.exe" then
            local l_0_28 = nil
            do
              do
                if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) ~= nil then
                  local l_0_29 = nil
                  -- DECOMPILER ERROR at PC901: Overwrote pending register: R13 in 'AssignReg'

                  -- DECOMPILER ERROR at PC902: Overwrote pending register: R13 in 'AssignReg'

                  if (mp.GetProcessCommandLine)(l_0_27) ~= nil and (mp.GetProcessCommandLine)(l_0_27) ~= "" then
                    l_0_28 = (mp.GetProcessCommandLine)(l_0_27)
                    l_0_27 = l_0_27(l_0_28)
                    -- DECOMPILER ERROR at PC907: Overwrote pending register: R13 in 'AssignReg'

                    l_0_28 = l_0_27
                    l_0_29 = "-s%s+([^%s]+)"
                    l_0_27 = l_0_27(l_0_28, l_0_29)
                    if l_0_27 == "bits" then
                      l_0_28 = mp
                      l_0_28 = l_0_28.CLEAN
                      return l_0_28
                    end
                    l_0_28 = string
                    l_0_28 = l_0_28.match
                    -- DECOMPILER ERROR at PC918: Confused about usage of register: R12 in 'UnsetPending'

                    l_0_29 = l_0_27
                    l_0_28 = l_0_28(l_0_29, "-s%s+(....)")
                    l_0_27 = l_0_28
                    if l_0_27 == "bits" then
                      l_0_28 = mp
                      l_0_28 = l_0_28.CLEAN
                      return l_0_28
                    end
                  end
                end
                if (string.match)(l_0_27, l_0_28) == ".tmp" then
                  return mp.CLEAN
                end
                ;
                (mp.set_mpattribute)("MpDisableMOACSyncInsert")
                ;
                (mp.set_mpattribute)("MpDisableCaching")
                if (MpCommon.GetPersistContextCount)(l_0_2) == 0 then
                  local l_0_30 = l_0_28
                  -- DECOMPILER ERROR at PC954: Overwrote pending register: R13 in 'AssignReg'

                  ;
                  (table.insert)(l_0_27, l_0_30)
                  -- DECOMPILER ERROR at PC959: Overwrote pending register: R13 in 'AssignReg'

                  -- DECOMPILER ERROR at PC960: Confused about usage of register: R11 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC960: Overwrote pending register: R14 in 'AssignReg'

                  ;
                  (MpCommon.SetPersistContext)(l_0_27, l_0_30, 0)
                else
                  do
                    do
                      -- DECOMPILER ERROR at PC967: Overwrote pending register: R13 in 'AssignReg'

                      -- DECOMPILER ERROR at PC974: Overwrote pending register: R13 in 'AssignReg'

                      -- DECOMPILER ERROR at PC975: Overwrote pending register: R14 in 'AssignReg'

                      if not (MpCommon.QueryPersistContext)(l_0_2, l_0_27) then
                        (MpCommon.AppendPersistContext)(l_0_2, l_0_27, l_0_30)
                      end
                      do return mp.INFECTED end
                      do return mp.CLEAN end
                      -- DECOMPILER ERROR at PC983: Confused about usage of register R12 for local variables in 'ReleaseLocals'

                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

