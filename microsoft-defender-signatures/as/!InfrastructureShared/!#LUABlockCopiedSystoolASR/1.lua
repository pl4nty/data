local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.IsHipsRuleEnabled
L2_1 = "c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = "enghipscpy:blockexecution:c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb"
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = mp
L4_1 = L4_1.IsPathExcludedForHipsRule
L5_1 = L3_1
L6_1 = "c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L2_1
L6_1 = L1_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.IsHipsRuleEnabled
  L5_1 = "c0033c00-d16d-4114-a5a0-dc9b3a7d2ceb"
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONOPEN
if L0_1 == L4_1 then
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.bitand
    L5_1 = mp
    L5_1 = L5_1.get_contextdata
    L6_1 = mp
    L6_1 = L6_1.CONTEXT_DATA_DESIREDACCESS
    L5_1 = L5_1(L6_1)
    L6_1 = 32
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= 32 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
else
  L4_1 = mp
  L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = MpCommon
L4_1 = L4_1.ExpandEnvironmentVariables
L5_1 = "%systemroot%"
L4_1 = L4_1(L5_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = L4_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = ":\\$winreagent\\"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = ":\\mount[^\\]*\\windows\\winsxs\\temp\\pendingrenames\\"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.sub
L6_1 = L3_1
L7_1 = 2
L8_1 = 12
L5_1 = L5_1(L6_1, L7_1, L8_1)
if L5_1 == ":\\$windows." then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = ":\\windows.old\\"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = ":\\$sysreset\\"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = ":\\winpe\\windows\\"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = MpCommon
L6_1 = L6_1.ExpandEnvironmentVariables
L7_1 = "%programfiles%"
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L6_1(L7_1)
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
if L5_1 ~= nil then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = L5_1
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files\\windowsapps\\"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files\\git\\"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\java\\jre[^\\]*\\bin\\"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\java\\jdk[^\\]*\\bin\\"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\java\\jre[^\\]*\\bin\\"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files\\sharp\\file-copy\\robocopy.exe"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files\\wsl\\wsl.exe"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\microsoft onedrive\\standaloneupdater\\onedrivesetup.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\microsoft onedrive\\[%d%.]+\\onedrivesetup.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\microsoft onedrive\\update\\onedrivesetup.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\microsoft office\\root\\client\\appvdllsurrogate%d*%.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\microsoft office\\updates\\download\\packagefiles\\[^\\]+\\root\\client\\appvdllsurrogate%d*%.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\common files\\microsoft shared\\"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\remote debugger\\x%d%d\\vsgraphicsremoteengine%.exe"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\extensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\extensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\extensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\extensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\extensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\professional\\common%d\\ide\\commonextensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\enterprise\\common%d\\ide\\commonextensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\community\\common%d\\ide\\commonextensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\preview\\common%d\\ide\\commonextensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L3_1
      L8_1 = ":\\program files[^\\]*\\microsoft visual studio\\%d%d%d%d\\buildtools\\common%d\\ide\\commonextensions\\microsoft\\"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\wsl\\wslg.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\windows kits\\%d+\\app certification kit\\aitstatic.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L3_1
    L8_1 = ":\\program files[^\\]*\\sophos\\endpoint defense\\sophosna.exe"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 ~= nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
end
else
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = "\\appdata\\local\\microsoft\\onedrive\\standaloneupdater\\onedrivesetup.*%.exe"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = "\\appdata\\local\\microsoft\\onedrive\\update\\onedrivesetup.*%.exe"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = "\\appdata\\local\\microsoft\\onedrive\\[%d%.]+\\onedrivesetup.*%.exe"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = ":\\programdata\\microsoft\\grouppolicy\\users\\[^\\]+\\datastore\\0\\sysvol\\fcc%.intfcc%.local\\policies\\[^\\]+\\user\\[^\\]+\\logon\\bginfo%.exe"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = ":\\programdata\\docker\\windowsfilter\\"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = ":\\programdata\\dell\\saremediation\\systemrepair\\snapshots\\"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L3_1
  L8_1 = ":\\programdata\\dell\\saremediation\\tempdrivers\\dell"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 ~= nil then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_FILENAME
L6_1 = L6_1(L7_1)
if L6_1 == nil or L6_1 == "" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
if L6_1 == "mpsigstub.exe" then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = "[a-z]:\\{00000000%-0000%-0000%-0000%-000000000000}\\svroot\\windows\\temp\\[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = "[a-z]:\\program files[^\\]+\\tanium\\tanium client\\data\\temp\\[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = "[a-z]:\\users\\.+\\appdata\\local\\temp\\[%d\\]*[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+%-[0-9a-f]+\\mpsigstub%.exe$"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = "[a-z]:\\programdata\\microsoft\\windows defender\\platform\\[^\\]+\\mpsigstub%.exe$"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 ~= nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L7_1 = versioning
L7_1 = L7_1.GetOrgID
L7_1 = L7_1()
if L7_1 ~= nil and L7_1 ~= "" then
  L8_1 = string
  L8_1 = L8_1.lower
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  L7_1 = L8_1
  if L7_1 == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
    L8_1 = MpCommon
    L8_1 = L8_1.IsSampled
    L9_1 = 15000
    L10_1 = false
    L11_1 = true
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if L8_1 == true and L6_1 == "klist.exe" then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L3_1
      L10_1 = ":\\program files[^\\]*\\.+\\jre\\bin\\"
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 ~= nil then
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
    end
  end
end
L8_1 = false
L9_1 = pe
L9_1 = L9_1.get_versioninfo
L9_1 = L9_1()
if L9_1 ~= nil then
  L10_1 = L9_1.OriginalFilename
  if L10_1 ~= nil then
    L10_1 = string
    L10_1 = L10_1.lower
    L11_1 = L9_1.OriginalFilename
    L10_1 = L10_1(L11_1)
    L11_1 = nil
    L12_1 = string
    L12_1 = L12_1.match
    L13_1 = L10_1
    L14_1 = "%.([^%.]+)$"
    L12_1 = L12_1(L13_1, L14_1)
    L11_1 = L12_1
    if L11_1 == nil then
      L12_1 = L10_1
      L13_1 = ".exe"
      L10_1 = L12_1 .. L13_1
      L11_1 = "exe"
    end
    if L11_1 == "exe" then
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L10_1
      L14_1 = "onedrivesetup.*%.exe"
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 ~= nil then
        L12_1 = mp
        L12_1 = L12_1.IsTrustedFile
        L13_1 = false
        L12_1, L13_1 = L12_1(L13_1)
        if L12_1 == true then
          L14_1 = mp
          L14_1 = L14_1.CLEAN
          return L14_1
        end
      end
      L12_1 = sysio
      L12_1 = L12_1.IsFileExists
      L13_1 = L4_1
      L14_1 = "\\system32\\"
      L15_1 = L10_1
      L13_1 = L13_1 .. L14_1 .. L15_1
      L12_1 = L12_1(L13_1)
      if L12_1 then
        L8_1 = true
      end
      if not L8_1 then
        L12_1 = sysio
        L12_1 = L12_1.IsFileExists
        L13_1 = L4_1
        L14_1 = "\\syswow64\\"
        L15_1 = L10_1
        L13_1 = L13_1 .. L14_1 .. L15_1
        L12_1 = L12_1(L13_1)
        if L12_1 then
          L8_1 = true
        end
      end
    end
  end
end
if not L8_1 then
  L10_1 = string
  L10_1 = L10_1.match
  L11_1 = L6_1
  L12_1 = "(%.[^%.]+)$"
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 == ".exe" then
    L10_1 = sysio
    L10_1 = L10_1.IsFileExists
    L11_1 = L4_1
    L12_1 = "\\system32\\"
    L13_1 = L6_1
    L11_1 = L11_1 .. L12_1 .. L13_1
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L8_1 = true
    end
    if not L8_1 then
      L10_1 = sysio
      L10_1 = L10_1.IsFileExists
      L11_1 = L4_1
      L12_1 = "\\syswow64\\"
      L13_1 = L6_1
      L11_1 = L11_1 .. L12_1 .. L13_1
      L10_1 = L10_1(L11_1)
      if L10_1 then
        L8_1 = true
      end
    end
  end
end
if not L8_1 then
  L10_1 = MpCommon
  L10_1 = L10_1.GetOriginalFileName
  L11_1 = L2_1
  L10_1 = L10_1(L11_1)
  if L10_1 ~= nil and L10_1 ~= "" then
    L11_1 = nil
    L12_1 = string
    L12_1 = L12_1.match
    L13_1 = L10_1
    L14_1 = "%.([^%.]+)$"
    L12_1 = L12_1(L13_1, L14_1)
    L11_1 = L12_1
    if L11_1 == nil then
      L12_1 = L10_1
      L13_1 = ".exe"
      L10_1 = L12_1 .. L13_1
      L11_1 = "exe"
    end
    L12_1 = string
    L12_1 = L12_1.lower
    L13_1 = L11_1
    L12_1 = L12_1(L13_1)
    L11_1 = L12_1
    if L11_1 == "exe" then
      L12_1 = sysio
      L12_1 = L12_1.IsFileExists
      L13_1 = L4_1
      L14_1 = "\\system32\\"
      L15_1 = L10_1
      L13_1 = L13_1 .. L14_1 .. L15_1
      L12_1 = L12_1(L13_1)
      if L12_1 then
        L8_1 = true
      end
      if not L8_1 then
        L12_1 = sysio
        L12_1 = L12_1.IsFileExists
        L13_1 = L4_1
        L14_1 = "\\syswow64\\"
        L15_1 = L10_1
        L13_1 = L13_1 .. L14_1 .. L15_1
        L12_1 = L12_1(L13_1)
        if L12_1 then
          L8_1 = true
        end
      end
    end
  end
end
if L8_1 then
  L10_1 = mp
  L10_1 = L10_1.get_contextdata
  L11_1 = mp
  L11_1 = L11_1.CONTEXT_DATA_PROCESSNAME
  L10_1 = L10_1(L11_1)
  if L10_1 ~= nil and L10_1 ~= "" then
    L11_1 = string
    L11_1 = L11_1.lower
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    L10_1 = L11_1
    if L10_1 == "svchost.exe" then
      L11_1 = mp
      L11_1 = L11_1.get_contextdata
      L12_1 = mp
      L12_1 = L12_1.CONTEXT_DATA_PROCESS_PPID
      L11_1 = L11_1(L12_1)
      if L11_1 ~= nil then
        L12_1 = mp
        L12_1 = L12_1.GetProcessCommandLine
        L13_1 = L11_1
        L12_1 = L12_1(L13_1)
        if L12_1 ~= nil and L12_1 ~= "" then
          L13_1 = string
          L13_1 = L13_1.lower
          L14_1 = L12_1
          L13_1 = L13_1(L14_1)
          L12_1 = L13_1
          L13_1 = string
          L13_1 = L13_1.match
          L14_1 = L12_1
          L15_1 = "-s%s+([^%s]+)"
          L13_1 = L13_1(L14_1, L15_1)
          if L13_1 == "bits" then
            L14_1 = mp
            L14_1 = L14_1.CLEAN
            return L14_1
          end
          L14_1 = string
          L14_1 = L14_1.match
          L15_1 = L12_1
          L16_1 = "-s%s+(....)"
          L14_1 = L14_1(L15_1, L16_1)
          L13_1 = L14_1
          if L13_1 == "bits" then
            L14_1 = mp
            L14_1 = L14_1.CLEAN
            return L14_1
          end
        end
      end
      L12_1 = string
      L12_1 = L12_1.match
      L13_1 = L6_1
      L14_1 = "(%.[^%.]+)$"
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 == ".tmp" then
        L12_1 = mp
        L12_1 = L12_1.CLEAN
        return L12_1
      end
    end
  end
  L11_1 = mp
  L11_1 = L11_1.set_mpattribute
  L12_1 = "MpDisableMOACSyncInsert"
  L11_1(L12_1)
  L11_1 = mp
  L11_1 = L11_1.set_mpattribute
  L12_1 = "MpDisableCaching"
  L11_1(L12_1)
  L11_1 = MpCommon
  L11_1 = L11_1.GetPersistContextCount
  L12_1 = L2_1
  L11_1 = L11_1(L12_1)
  if L11_1 == 0 then
    L11_1 = {}
    L12_1 = table
    L12_1 = L12_1.insert
    L13_1 = L11_1
    L14_1 = L1_1
    L12_1(L13_1, L14_1)
    L12_1 = MpCommon
    L12_1 = L12_1.SetPersistContext
    L13_1 = L2_1
    L14_1 = L11_1
    L15_1 = 0
    L12_1(L13_1, L14_1, L15_1)
  else
    L11_1 = MpCommon
    L11_1 = L11_1.QueryPersistContext
    L12_1 = L2_1
    L13_1 = L1_1
    L11_1 = L11_1(L12_1, L13_1)
    if not L11_1 then
      L11_1 = MpCommon
      L11_1 = L11_1.AppendPersistContext
      L12_1 = L2_1
      L13_1 = L1_1
      L14_1 = 0
      L11_1(L12_1, L13_1, L14_1)
    end
  end
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
