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
local l_0_7 = (versioning.GetOrgID)()
if l_0_7 ~= nil and l_0_7 ~= "" then
  l_0_7 = (string.lower)(l_0_7)
end
local l_0_8 = false
if (string.match)(l_0_6, "(%.[^%.]+)$") == ".exe" then
  if (sysio.IsFileExists)(l_0_4 .. "\\system32\\" .. l_0_6) then
    l_0_8 = true
  end
  if not l_0_8 and (sysio.IsFileExists)(l_0_4 .. "\\syswow64\\" .. l_0_6) then
    l_0_8 = true
  end
end
if not l_0_8 then
  local l_0_9 = (MpCommon.GetOriginalFileName)(l_0_2)
  if l_0_9 ~= nil and l_0_9 ~= "" then
    local l_0_10 = nil
    l_0_10 = (string.match)(l_0_9, "%.([^%.]+)$")
    if l_0_10 == nil then
      l_0_9 = l_0_9 .. ".exe"
      l_0_10 = "exe"
    end
    if l_0_7 == "d7c7c745-195f-4223-9c7a-99fb420fd000" and (MpCommon.IsSampled)(45000, false, true, true) == true then
      l_0_10 = (string.lower)(l_0_10)
    end
    if l_0_10 == "exe" then
      if (sysio.IsFileExists)(l_0_4 .. "\\system32\\" .. l_0_9) then
        l_0_8 = true
      end
      if not l_0_8 and (sysio.IsFileExists)(l_0_4 .. "\\syswow64\\" .. l_0_9) then
        l_0_8 = true
      end
    end
  end
end
do
  if not l_0_8 then
    local l_0_11 = (pe.get_versioninfo)()
    if l_0_11 == nil then
      return mp.CLEAN
    end
    if l_0_11.OriginalFilename == nil then
      return mp.CLEAN
    end
    local l_0_12 = ((string.lower)(l_0_11.OriginalFilename))
    local l_0_13 = nil
    l_0_13 = (string.match)(l_0_12, "%.([^%.]+)$")
    if l_0_13 == nil then
      l_0_12 = l_0_12 .. ".exe"
    else
      if l_0_13 ~= "exe" then
        return mp.CLEAN
      end
    end
    do
      if l_0_7 == "d7c7c745-195f-4223-9c7a-99fb420fd000" and (MpCommon.IsSampled)(45000, false, true, true) == true and (string.find)(l_0_12, "onedrivesetup.*%.exe") ~= nil then
        local l_0_15 = (mp.IsTrustedFile)(false)
        if l_0_15 == true then
          return mp.CLEAN
        end
      end
      local l_0_14 = sysio.IsFileExists
      do
        local l_0_16 = l_0_4 .. "\\system32\\" .. l_0_12
        l_0_14 = l_0_14(l_0_16)
        if l_0_14 then
          l_0_8 = true
        end
        if not l_0_8 then
          l_0_14 = sysio
          l_0_14 = l_0_14.IsFileExists
          l_0_16 = l_0_4
          l_0_16 = l_0_16 .. "\\syswow64\\" .. l_0_12
          l_0_14 = l_0_14(l_0_16)
          if l_0_14 then
            l_0_8 = true
          end
        end
        if l_0_8 then
          local l_0_17 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
          if l_0_17 ~= nil and l_0_17 ~= "" then
            l_0_17 = (string.lower)(l_0_17)
            if l_0_17 == "svchost.exe" then
              local l_0_18 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
              do
                do
                  if l_0_18 ~= nil then
                    local l_0_19 = (mp.GetProcessCommandLine)(l_0_18)
                    if l_0_19 ~= nil and l_0_19 ~= "" then
                      l_0_19 = (string.lower)(l_0_19)
                      if (string.match)(l_0_19, "-s%s+([^%s]+)") == "bits" then
                        return mp.CLEAN
                      end
                      if (string.match)(l_0_19, "-s%s+(....)") == "bits" then
                        return mp.CLEAN
                      end
                    end
                  end
                  if (string.match)(l_0_6, "(%.[^%.]+)$") == ".tmp" then
                    return mp.CLEAN
                  end
                  ;
                  (mp.set_mpattribute)("MpDisableMOACSyncInsert")
                  ;
                  (mp.set_mpattribute)("MpDisableCaching")
                  if (MpCommon.GetPersistContextCount)(l_0_2) == 0 then
                    local l_0_20 = {}
                    ;
                    (table.insert)(l_0_20, l_0_1)
                    ;
                    (MpCommon.SetPersistContext)(l_0_2, l_0_20, 0)
                  else
                    do
                      do
                        if not (MpCommon.QueryPersistContext)(l_0_2, l_0_1) then
                          (MpCommon.AppendPersistContext)(l_0_2, l_0_1, 0)
                        end
                        do return mp.INFECTED end
                        return mp.CLEAN
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
end

