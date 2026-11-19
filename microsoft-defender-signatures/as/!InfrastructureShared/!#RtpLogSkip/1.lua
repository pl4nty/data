-- Threat: !InfrastructureShared
-- Name: !#RtpLogSkip
-- Type: 26

local function l_0_0(l_1_0, l_1_1, l_1_2)
  if type(l_1_1) == "table" then
    if l_1_2 == nil then
      l_1_2 = 4
    end
    return l_1_0 ~= nil and l_1_1 ~= nil and l_1_2 <= #l_1_0 and l_1_1[string.sub(l_1_0, -l_1_2)] ~= nil
  end
  return l_1_1 == "" or string.sub(l_1_0, -string.len(l_1_1)) == l_1_1
end

local function l_0_1(l_2_0, l_2_1)
  return string.sub(l_2_0, 1, string.len(l_2_1)) == l_2_1
end

local function l_0_2(l_3_0)
  if l_3_0 == "package.json" or l_3_0 == "package-lock.json" or l_3_0 == "setup.cjs" or l_3_0 == "setup.mjs" or l_3_0 == "setup.js" or l_3_0 == "binding.gyp" or l_3_0 == "bun_environment.js" or l_3_0 == "lib.js" or l_3_0 == "lib.mjs" or l_3_0 == "bundle.js" or l_3_0 == "mcp.json" or l_3_0 == "openclaw.json" or l_3_0 == "settings.json" then
    return true
  end
  if l_0_0(l_3_0, "install.js") then
    return true
  end
  if l_0_0(l_3_0, ".mdc") then
    return true
  end
  if (l_0_0(l_3_0, ".js") or l_0_0(l_3_0, ".cjs") or l_0_0(l_3_0, ".mjs")) and (string.find(l_3_0, "encoded", 1, true) ~= nil or string.find(l_3_0, "math", 1, true) ~= nil or string.find(l_3_0, "index", 1, true) ~= nil or string.find(l_3_0, "payload", 1, true) ~= nil) then
    return true
  end
  return false
end

local function l_0_3(l_4_0)
  if l_4_0 == "setup.py" or l_4_0 == "setup.cfg" or l_4_0 == "pyproject.toml" or l_4_0 == "conftest.py" or l_4_0 == "sitecustomize.py" or l_4_0 == "usercustomize.py" then
    return true
  end
  if l_0_0(l_4_0, ".pth") then
    return true
  end
  if l_0_0(l_4_0, ".py") and (string.find(l_4_0, "encoded", 1, true) ~= nil or string.find(l_4_0, "payload", 1, true) ~= nil) then
    return true
  end
  return false
end

local function l_0_4(l_5_0, l_5_1)
  local l_5_2 = l_5_1:match("^subprocess_cli%.cpython%-%d+%.pyc$") or l_5_1:match("^subprocess_cli%.cpython%-%d+%.opt%-[12]%.pyc$")
  if (l_5_1 == "subprocess_cli.pyc" or l_5_2) and l_0_0(l_5_0, "\\claude_agent_sdk\\_internal\\transport") or l_5_2 and l_0_0(l_5_0, "\\claude_agent_sdk\\_internal\\transport\\__pycache__") then
    return false
  end
  local l_5_3 = l_5_1:match("^_telemetry%.cpython%-%d+%.pyc$") or l_5_1:match("^_telemetry%.cpython%-%d+%.opt%-[12]%.pyc$")
  if (l_5_1 == "_telemetry.pyc" or l_5_3) and l_0_0(l_5_0, "\\agent_framework") or l_5_3 and l_0_0(l_5_0, "\\agent_framework\\__pycache__") then
    return false
  end
  local l_5_4 = l_5_1:match("^__init__%.cpython%-%d+%.pyc$") or l_5_1:match("^__init__%.cpython%-%d+%.opt%-[12]%.pyc$")
  if (l_5_1 == "__init__.pyc" or l_5_4) and l_0_0(l_5_0, "\\langchain\\agents") or l_5_4 and l_0_0(l_5_0, "\\langchain\\agents\\__pycache__") then
    return false
  end
  local l_5_5 = l_5_1:match("^openai_provider%.cpython%-%d+%.pyc$") or l_5_1:match("^openai_provider%.cpython%-%d+%.opt%-[12]%.pyc$")
  if (l_5_1 == "openai_provider.pyc" or l_5_5) and l_0_0(l_5_0, "\\agents\\models") or l_5_5 and l_0_0(l_5_0, "\\agents\\models\\__pycache__") then
    return false
  end
  local l_5_6 = l_5_1:match("^_client_labels_utils%.cpython%-%d+%.pyc$") or l_5_1:match("^_client_labels_utils%.cpython%-%d+%.opt%-[12]%.pyc$")
  if (l_5_1 == "_client_labels_utils.pyc" or l_5_6) and l_0_0(l_5_0, "\\google\\adk\\utils") or l_5_6 and l_0_0(l_5_0, "\\google\\adk\\utils\\__pycache__") then
    return false
  end
  return true
end

local function l_0_5(l_6_0)
  if string.find(l_6_0, "\\appdata\\roaming\\code\\", 1, true) ~= nil or string.find(l_6_0, "\\appdata\\roaming\\code - insiders\\", 1, true) ~= nil then
    return true
  end
  if string.find(l_6_0, "\\microsoft vs code", 1, true) ~= nil then
    return true
  end
  return false
end

local function l_0_6(l_7_0)
  if l_7_0:match("^\\device\\harddiskvolume%d*\\program files\\microsoft vs code") ~= nil or l_7_0:match("^\\device\\harddiskvolume%d*\\program files %(x86%)\\microsoft vs code") ~= nil then
    return true
  end
  if l_7_0:match("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\programs\\microsoft vs code") ~= nil then
    return true
  end
  return false
end

local function l_0_7(l_8_0)
  if l_8_0:match("^\\device\\harddiskvolume%d*\\program files\\microsoft visual studio") ~= nil or l_8_0:match("^\\device\\harddiskvolume%d*\\program files %(x86%)\\microsoft visual studio") ~= nil then
    return true
  end
  return false
end

local l_0_8 = skip.get_contextdata(skip.CONTEXT_DATA_SCANREASON)
if l_0_8 == skip.SCANREASON_AMSI then
  local l_0_9 = skip.get_contextdata(skip.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_9 ~= nil then
    l_0_9 = string.lower(l_0_9)
    if l_0_9 == "exchange server 2019" or l_0_9 == "exchange server 2016" then
      local l_0_10 = skip.get_contextdata(skip.CONTEXT_DATA_AMSI_CONTENTNAME)
      if l_0_10 ~= nil then
        l_0_10 = string.lower(l_0_10)
        if l_0_1(l_0_10, "urlpath:/mapi/emsmdb") or l_0_1(l_0_10, "urlpath:/rpc/rpcproxy.dll") or l_0_1(l_0_10, "urlpath:/owa/service.svc") then
          return true
        end
      end
    end
  end
end
if l_0_8 ~= skip.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_8 ~= skip.SCANREASON_ONOPEN and l_0_8 ~= skip.SCANREASON_ONMOUNT then
  return 0
end
if skip.get_contextdata(skip.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return 0
end

local function l_0_11(l_9_0, l_9_1)
  if l_9_0 == "excel.exe" or l_9_0 == "winword.exe" or l_9_0 == "powerpnt.exe" or l_9_0 == "outlook.exe" or l_9_0 == "msaccess.exe" or l_9_0 == "mspub.exe" or l_9_0 == "onenote.exe" then
    if l_9_1:find("^\\device\\harddiskvolume%d*\\program files\\microsoft office\\root\\office") ~= nil then
      return true
    end
    if l_9_1:find("^\\device\\harddiskvolume%d*\\program files %(x86%)\\microsoft office\\root\\office") ~= nil then
      return true
    end
    if l_9_1:find("^\\device\\harddiskvolume%d*\\program files\\windowsapps\\microsoft%.office%.desktop%.") ~= nil then
      return true
    end
  end
  return false
end

local l_0_12 = string.lower(skip.get_contextdata(skip.CONTEXT_DATA_FILEPATH))
local l_0_13 = skip.get_contextdata(skip.CONTEXT_DATA_PROCESS_ID)
if l_0_13 == 4 and l_0_8 == skip.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_14, l_0_15, l_0_16 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs")
  if l_0_14 ~= nil and l_0_15 ~= nil and l_0_16 ~= nil then
    return 1
  end
end
local l_0_17 = string.lower(skip.get_contextdata(skip.CONTEXT_DATA_FILENAME))
if l_0_17 == "pagefile.sys" or l_0_17 == "hiberfil.sys" or l_0_17 == "swapfile.sys" then
  local l_0_18 = l_0_12:match("^\\device\\harddiskvolumeshadowcopy%d*$")
  if l_0_18 ~= nil then
    return 1
  end
  local l_0_19 = l_0_12:match("^\\device\\harddiskvolume%d*$")
  if l_0_19 ~= nil then
    return 1
  end
end
local l_0_20 = string.lower(skip.get_contextdata(skip.CONTEXT_DATA_PROCESSNAME))
if l_0_20 == "rundll32.exe" or l_0_20 == "dllhost.exe" or l_0_20 == "regsvr32.exe" or l_0_20 == "cscript.exe" or l_0_20 == "jscript.exe" or l_0_20 == "cmd.exe" or l_0_20 == "curl.exe" or l_0_20 == "powershell.exe" or l_0_20 == "powershell_ise.exe" or l_0_20 == "wscript.exe" or l_0_20 == "mshta.exe" or l_0_20 == "csc.exe" or l_0_20 == "jsc.exe" or l_0_20 == "vbc.exe" then
  return 0
end
local l_0_21 = string.lower(skip.get_contextdata(skip.CONTEXT_DATA_PROCESSDEVICEPATH))
if l_0_20 == "civ7_win64_dx12_finalrelease.exe" then
  local l_0_22 = l_0_21:match("^(\\device\\harddiskvolume%d+\\.-\\steamapps\\common\\sid meier's civilization vii)\\base\\binaries\\win64$")
  if l_0_22 ~= nil then
    if l_0_12 == l_0_22 or l_0_1(l_0_12, l_0_22 .. "\\") then
      return 1
    end
    local l_0_23 = l_0_12:match("^\\device\\harddiskvolume%d+\\users\\[^\\]+\\appdata\\local\\firaxis games\\sid meier's civilization vii(.*)$")
    if l_0_23 ~= nil and (l_0_23 == "" or l_0_1(l_0_23, "\\")) then
      return 1
    end
  end
end
if l_0_8 == skip.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_20 == "svchost.exe" then
  local l_0_24 = l_0_12:match("^\\device\\harddiskvolume(%d+)\\windows\\serviceprofiles\\localservice\\appdata\\local\\microsoft\\ngc\\pregenpool$")
  if l_0_24 == nil then
    local l_0_25, l_0_26, l_0_27, l_0_28, l_0_29, l_0_30 = l_0_12:match("^\\device\\harddiskvolume(%d+)\\windows\\serviceprofiles\\localservice\\appdata\\local\\microsoft\\ngc\\%{([0-9a-f]+)%-([0-9a-f]+)%-([0-9a-f]+)%-([0-9a-f]+)%-([0-9a-f]+)%}\\temp$")
    if l_0_26 ~= nil and string.len(l_0_26) == 8 and string.len(l_0_27) == 4 and string.len(l_0_28) == 4 and string.len(l_0_29) == 4 and string.len(l_0_30) == 12 then
      l_0_24 = l_0_25
    end
  end
  local l_0_31 = l_0_21:match("^\\device\\harddiskvolume(%d+)\\windows\\system32$")
  if l_0_24 ~= nil and l_0_24 == l_0_31 then
    local l_0_32 = skip.get_contextdata(skip.CONTEXT_DATA_FILENAME)
    local l_0_33, l_0_34, l_0_35, l_0_36, l_0_37 = l_0_32:match("^%{([0-9A-F]+)%-([0-9A-F]+)%-([0-9A-F]+)%-([0-9A-F]+)%-([0-9A-F]+)%}$")
    if l_0_33 ~= nil and string.len(l_0_33) == 8 and string.len(l_0_34) == 4 and string.len(l_0_35) == 4 and string.len(l_0_36) == 4 and string.len(l_0_37) == 12 then
      return 1
    end
  end
end
if l_0_8 == 1 then
  if l_0_20 == "wmiprvse.exe" then
    local l_0_38 = l_0_21:match("^\\device\\harddiskvolume(.*)\\windows")
    if l_0_38 ~= nil and l_0_17:match("^dr%d*$") then
      return 1
    end
  end
  return 0
end
local l_0_39 = false
if l_0_8 == skip.SCANREASON_ONOPEN and (l_0_20 == "python.exe" or l_0_20 == "pythonw.exe" or l_0_20 == "_conda.exe") then
  if l_0_0(l_0_17, ".pyc") then
    local l_0_40 = l_0_4(l_0_12, l_0_17)
    if l_0_20 == "python.exe" and l_0_40 then
      return 1
    end
    l_0_39 = not l_0_40
  elseif l_0_17 == "subprocess_cli.py" then
    l_0_39 = l_0_0(l_0_12, "\\claude_agent_sdk\\_internal\\transport")
  elseif l_0_17 == "_telemetry.py" then
    l_0_39 = l_0_0(l_0_12, "\\agent_framework")
  elseif l_0_17 == "__init__.py" then
    l_0_39 = l_0_0(l_0_12, "\\langchain\\agents")
  elseif l_0_17 == "openai_provider.py" then
    l_0_39 = l_0_0(l_0_12, "\\agents\\models")
  elseif l_0_17 == "_client_labels_utils.py" then
    l_0_39 = l_0_0(l_0_12, "\\google\\adk\\utils")
  end
end
if l_0_20 == "software_reporter_tool.exe" and l_0_21:find("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\google\\chrome\\user data\\swreporter") ~= nil then
  return 1
end
if l_0_8 == skip.SCANREASON_ONOPEN and l_0_20 == "idwutil_600.exe" and l_0_0(l_0_21, "\\program files (x86)\\idrivewindows\\cmd_dutil") then
  return 1
end
if l_0_8 == skip.SCANREASON_ONMODIFIEDHANDLECLOSE and not skip.IsHipsRuleEnabled("56a863a9-875e-4185-98a7-b882c64b5ce5") then
  if l_0_11(l_0_20, l_0_21) and not skip.IsHipsRuleEnabled("3b576869-a4ec-4529-8536-b80a7769e899") and not skip.IsHipsRuleEnabled("92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B") and not skip.IsHipsRuleEnabled("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") and not skip.IsHipsRuleEnabled("c28bf0fb-388c-438b-a41d-8688461af900") and not l_0_0(l_0_17, ".xoml") then
    return 1
  end
  if string.find(l_0_20, "rar.exe", 1, true) ~= nil or string.sub(l_0_20, 1, 2) == "7z" then
    local l_0_42 = string.find(l_0_21, "\\program files\\7-zip", 1, true) ~= nil or string.find(l_0_21, "\\program files (x86)\\7-zip", 1, true) ~= nil
    local l_0_44 = l_0_42 and string.sub(l_0_20, 1, 2) == "7z" and (l_0_20 == "7z.exe" or l_0_20 == "7za.exe" or l_0_20 == "7zfm.exe" or l_0_20 == "7zg.exe" or string.find(l_0_20, "7z%d%d%d%d%-x64%.exe") ~= nil or string.find(l_0_20, "7z%d%d%d%d%.exe") ~= nil)
    local l_0_46 = string.find(l_0_21, "\\program files\\winrar", 1, true) ~= nil or string.find(l_0_21, "\\program files (x86)\\winrar", 1, true) ~= nil
    local l_0_48 = l_0_46 and (l_0_20 == "rar.exe" or l_0_20 == "unrar.exe" or l_0_20 == "winrar.exe")
    if (l_0_44 or l_0_48) and not skip.IsHipsRuleEnabled("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") and not skip.IsHipsRuleEnabled("5beb7efe-fd9a-4556-801d-275e5ffc04cc") then
      return 1
    end
  end
  if (l_0_20 == "setup.exe" or l_0_20 == "install.exe" or l_0_20 == "installer.exe" or l_0_20 == "uninstall.exe" or l_0_20 == "uninstaller.exe") and (l_0_21:match("^\\device\\harddiskvolume%d*\\program files\\") ~= nil or l_0_21:match("^\\device\\harddiskvolume%d*\\program files %(x86%)\\") ~= nil) then
    return 1
  end
  if string.find(l_0_20, "setup", 1, true) ~= nil or string.find(l_0_20, "install", 1, true) ~= nil then
    local l_0_49, l_0_50 = l_0_12:match("^\\device\\harddiskvolume%d*\\users\\([^\\]+)\\appdata\\local\\programs\\([^\\]+)\\")
    if l_0_49 and l_0_50 then
      return 1
    end
  end
  if l_0_20 == "setup.exe" and l_0_12:match("^\\device\\harddiskvolume%d*\\users\\[^\\]+\\appdata\\local\\waveboxapp\\temp\\source%d+\\chrome%-bin\\") ~= nil then
    return 1
  end
  if string.find(l_0_12, "\\program files", 1, true) ~= nil then
    local l_0_51 = l_0_12:match("^\\device\\harddiskvolume%d*\\program files\\")
    if l_0_51 ~= nil then
      return 1
    end
    l_0_51 = l_0_12:match("^\\device\\harddiskvolume%d*\\program files %(x86%)\\")
    if l_0_51 ~= nil then
      return 1
    end
  end
  if l_0_1(l_0_12, "\\device\\mup\\") then
    return 1
  end
  if string.find(l_0_21, "\\programdata\\ul\\pcmark", 1, true) ~= nil then
    return 1
  end
  if string.find(l_0_21, "\\program files\\windowsapps\\", 1, true) ~= nil or string.find(l_0_21, "\\windows\\systemapps\\", 1, true) ~= nil then
    return 1
  end
  if l_0_0(l_0_20, ".tmp") and l_0_0(l_0_17, ".tmp") then
    local l_0_52, l_0_53, l_0_54 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\(is%-[a-z0-9]+%.tmp)\\[^\\]+%.tmp$")
    if l_0_52 and l_0_53 and l_0_54 then
      return 1
    end
  end
  if string.sub(l_0_20, 1, 4) == "npp." and (l_0_0(l_0_20, ".installer.x64.exe") or l_0_0(l_0_20, ".installer.exe")) then
    return 1
  end
  if string.sub(l_0_20, 1, 7) == "rstudio" and string.find(l_0_20, "rstudio%d%.exe") ~= nil then
    return 1
  end
  if l_0_0(l_0_17, ".html") or l_0_0(l_0_17, ".css") then
    if string.find(l_0_12, "\\doc\\", 1, true) ~= nil then
      return 1
    end
    if string.find(l_0_12, "\\docs\\", 1, true) ~= nil then
      return 1
    end
  end
  local l_0_55, l_0_56 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\")
  if l_0_55 ~= nil and l_0_56 ~= nil then
    local l_0_57 = l_0_0(l_0_17, ".exe") or l_0_0(l_0_17, ".dll") or l_0_0(l_0_17, ".sys") or l_0_0(l_0_17, ".scr") or l_0_0(l_0_17, ".ocx") or l_0_0(l_0_17, ".cpl") or l_0_0(l_0_17, ".ps1") or l_0_0(l_0_17, ".psm1") or l_0_0(l_0_17, ".vbs") or l_0_0(l_0_17, ".vbe") or l_0_0(l_0_17, ".js") or l_0_0(l_0_17, ".jse") or l_0_0(l_0_17, ".cjs") or l_0_0(l_0_17, ".mjs") or l_0_0(l_0_17, ".node") or l_0_0(l_0_17, ".hta") or l_0_0(l_0_17, ".bat") or l_0_0(l_0_17, ".cmd") or l_0_0(l_0_17, ".jar") or l_0_0(l_0_17, ".lnk") or l_0_0(l_0_17, ".scf") or l_0_0(l_0_17, ".url") or l_0_0(l_0_17, ".chm") or l_0_0(l_0_17, ".iso") or l_0_0(l_0_17, ".img") or l_0_0(l_0_17, ".vhd") or l_0_0(l_0_17, ".vhdx") or l_0_0(l_0_17, ".msi") or l_0_0(l_0_17, ".msix") or l_0_0(l_0_17, ".appx") or l_0_0(l_0_17, ".mptest")
    if not l_0_57 then
      local l_0_58, l_0_59 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\")
      if l_0_55 == l_0_58 and l_0_56 == l_0_59 then
        return 1
      end
    end
  end
end
if string.sub(l_0_20, 1, 4) == "npp." then
  if l_0_0(l_0_20, ".installer.exe") and string.find(l_0_12, "^\\device\\harddiskvolume%d*\\program files %(x86%)\\notepad%+%+") ~= nil then
    return 1
  end
  if l_0_0(l_0_20, ".installer.x64.exe") and string.find(l_0_12, "^\\device\\harddiskvolume%d*\\program files\\notepad%+%+") ~= nil then
    return 1
  end
end
if (l_0_0(l_0_21, "\\windows\\system32") or string.find(l_0_21, "\\program files\\windowsapps\\", 1, true) ~= nil) and string.find(l_0_12, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
  return 1
end
if l_0_20 == "runtimebroker.exe" and l_0_0(l_0_21, "\\windows\\system32") and string.find(l_0_12, "appdata\\roaming\\microsoft\\systemcertificates\\my\\certificates", 1, true) ~= nil then
  return 1
end
if l_0_20 == "waworkerhost.exe" then
  if string.find(l_0_12, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
    return 1
  end
  if l_0_17:match("^%d*$") then
    return 1
  end
end
if l_0_20 == "microsoft.office.web.certificatemanager.exe" and l_0_12:match("^\\device\\harddiskvolume(.*)\\programdata\\microsoft\\crypto\\rsa\\machinekeys") ~= nil then
  return 1
end
if l_0_20 == "pingsender.exe" and l_0_0(l_0_21, "\\program files\\mozilla firefox") and string.find(l_0_12, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
  return 1
end
if (l_0_20 == "streaminganalysis.servicefabrichost.exe" or l_0_20 == "batchanalysis.servicefabrichost.exe") and (string.find(l_0_12, "\\saapp\\streamingstaticanalysisservice\\work\\", 1, true) ~= nil or string.find(l_0_12, "\\saapp\\batchstaticanalysisservice\\work\\", 1, true) ~= nil) then
  return 1
end
if l_0_20 == "microsoft.dataverse.copilot.indexing.textdata.exe" and string.find(l_0_12, "\\temp\\copilottextextraction\\", 1, true) ~= nil then
  return 1
end
if l_0_20 == "microsoft.dataverse.search.orchestratorservice.exe" and string.find(l_0_12, "\\temp\\relevancesearchtextextraction\\", 1, true) ~= nil then
  return 1
end
if l_0_20 == "chrome.exe" then
  if l_0_0(l_0_21, "\\google\\chrome\\application") and string.find(l_0_12, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
    return 1
  end
  local l_0_60, l_0_61 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\google\\chrome\\user data")
  if l_0_61 ~= nil and l_0_60 ~= nil then
    local l_0_62 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\google\\chrome\\application")
    if l_0_60 == l_0_62 then
      return 1
    end
  end
end
if l_0_8 == skip.SCANREASON_ONOPEN and l_0_20 == "electron.exe" then
  local l_0_63, l_0_64 = l_0_21:match("^\\device\\harddiskvolume(%d+)\\users\\([^\\]+)\\.+\\node_modules\\electron\\dist$")
  local l_0_65, l_0_66, l_0_67 = l_0_12:match("^\\device\\harddiskvolume(%d+)\\users\\([^\\]+)\\appdata\\local\\temp\\(.*)$")
  if l_0_63 ~= nil and l_0_63 == l_0_65 and l_0_64 == l_0_66 and string.find("\\" .. l_0_67 .. "\\", "\\node_modules\\", 1, true) ~= nil then
    return 1
  end
end
if l_0_20 == "doubao.exe" then
  local l_0_68, l_0_69 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\doubao\\user data")
  if l_0_69 ~= nil and l_0_68 ~= nil then
    local l_0_70 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\doubao\\application")
    if l_0_68 == l_0_70 then
      return 1
    end
  end
end
if l_0_20 == "msedge.exe" or l_0_20 == "msedgewebview2.exe" then
  if l_0_0(l_0_21, "\\application") and string.find(l_0_12, "microsoft\\cryptneturlcache\\", 1, true) ~= nil then
    return 1
  end
  local l_0_71, l_0_72, l_0_73 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\user data")
  local l_0_74, l_0_75, l_0_76 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application")
  if l_0_72 ~= nil and l_0_71 ~= nil and l_0_71 == l_0_74 and l_0_72 == l_0_75 and l_0_73 == l_0_76 then
    return 1
  end
  l_0_71, l_0_72, l_0_73 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\edge([^\\]*)\\application")
  if l_0_72 ~= nil and l_0_71 ~= nil and l_0_71 == l_0_74 and l_0_72 == l_0_75 and l_0_73 == l_0_76 then
    return 1
  end
  l_0_71, l_0_72 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp")
  if l_0_72 ~= nil and l_0_71 ~= nil and l_0_71 == l_0_74 and l_0_72 == l_0_75 and l_0_76 ~= nil then
    return 1
  end
  l_0_71, l_0_72 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages")
  if l_0_72 ~= nil and l_0_71 ~= nil and l_0_71 == l_0_74 and l_0_72 == l_0_75 and l_0_76 ~= nil then
    return 1
  end
  l_0_71 = l_0_12:match("^\\device\\harddiskvolume(.*)\\windows\\fonts")
  if l_0_71 ~= nil and l_0_71 == l_0_74 and l_0_75 ~= nil and l_0_76 ~= nil then
    return 1
  end
end
if l_0_20 == "onedrive.exe" or l_0_20 == "filecoauth.exe" or l_0_20 == "onedrivesetup.exe" or l_0_20 == "onedrivefilelauncher.exe" or l_0_20 == "onedrivestandaloneupdater.exe" then
  local l_0_77, l_0_78 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\onedrive")
  if l_0_77 ~= nil and l_0_78 ~= nil then
    local l_0_79, l_0_80 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\onedrive")
    if l_0_79 == l_0_77 and l_0_80 == l_0_78 and not l_0_0(l_0_17, ".dll") then
      return 1
    end
  end
end
if l_0_20 == "nuget.exe" then
  local l_0_81, l_0_82 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.nuget\\packages")
  if l_0_81 ~= nil and l_0_82 ~= nil then
    return 1
  end
end
if l_0_20 == "vlc-cache-gen.exe" then
  local l_0_83, l_0_84 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files([^\\]*)\\videolan\\vlc")
  local l_0_85, l_0_86 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files([^\\]*)\\videolan\\vlc")
  if l_0_83 ~= nil and l_0_83 == l_0_85 and l_0_84 == l_0_86 and (l_0_84 == "" or l_0_84 == " (x86)" or l_0_84 == " (arm)") then
    return 1
  end
end
if l_0_20 == "installer.exe" then
  local l_0_87, l_0_88 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\roaming\\zoom")
  if l_0_87 ~= nil and l_0_88 ~= nil then
    local l_0_89, l_0_90 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp")
    if l_0_87 == l_0_89 and l_0_88 == l_0_90 then
      return 1
    end
  end
end
if string.sub(l_0_20, 1, 5) == "gimp-" and l_0_0(l_0_20, "-setup.tmp") then
  local l_0_91 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files\\gimp 2")
  if l_0_91 ~= nil then
    return 1
  end
end
if string.sub(l_0_20, 1, 11) == "postgresql-" and l_0_0(l_0_20, "-windows-x64.exe") then
  local l_0_92 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files\\postgresql\\18\\")
  if l_0_92 ~= nil then
    return 1
  end
end
if (l_0_20 == "setup.exe" or l_0_20 == "un_a.exe") and l_0_8 == skip.SCANREASON_ONOPEN then
  local l_0_93, l_0_94 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp")
  if l_0_93 ~= nil and l_0_94 ~= nil then
    local l_0_95, l_0_96 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp")
    if l_0_93 == l_0_95 and l_0_94 == l_0_96 and (not l_0_0(l_0_17, ".dll") or l_0_12 ~= l_0_21) then
      return 1
    end
  else
    if l_0_93 == nil then
      l_0_93 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files\\mozilla ")
    end
    if l_0_93 == nil then
      l_0_93 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\mozilla ")
    end
    if l_0_93 ~= nil then
      local l_0_97, l_0_98 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp")
      if l_0_93 == l_0_97 and l_0_98 ~= nil and (not l_0_0(l_0_17, ".dll") or l_0_12 ~= l_0_21) then
        return 1
      end
    end
  end
end
if l_0_11(l_0_20, l_0_21) == true then
  if l_0_12:find("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\packages") ~= nil then
    return 1
  end
  if l_0_12:find("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\temp\\photocache") ~= nil then
    return 1
  end
  if l_0_12:find("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\microsoft\\office") ~= nil then
    return 1
  end
  if l_0_12:find("^\\device\\harddiskvolume%d*\\users\\[^\\]*\\appdata\\local\\microsoft\\msipc") ~= nil then
    return 1
  end
  if l_0_12:find("microsoft\\cryptneturlcache\\", 1, true) ~= nil then
    return 1
  end
end
if l_0_20 == "officeclicktorun.exe" then
  local l_0_99 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files\\common files\\microsoft shared\\clicktorun")
  if l_0_99 == nil then
    l_0_99 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\common files\\microsoft shared\\clicktorun")
  end
  if l_0_99 ~= nil then
    local l_0_100 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files\\common files\\microsoft shared\\clicktorun\\updates")
    if l_0_100 == nil then
      l_0_100 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\common files\\microsoft shared\\clicktorun\\updates")
    end
    if l_0_100 == nil then
      l_0_100 = l_0_12:match("^\\device\\harddiskvolume(.*)\\programdata\\microsoft\\clicktorun")
    end
    if l_0_100 == nil then
      l_0_100 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files\\microsoft office")
    end
    if l_0_100 == nil then
      l_0_100 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files %(x86%)\\microsoft office")
    end
    if l_0_100 == l_0_99 then
      return 1
    end
  end
end
if l_0_0(l_0_17, ".pf") then
  if l_0_13 == 4 then
    return 1
  end
  local l_0_101 = l_0_12:match("^\\device\\harddiskvolume(.*)\\windows\\prefetch")
  if l_0_101 ~= nil then
    if l_0_1(l_0_17, l_0_20) then
      return 1
    end
    local l_0_102 = l_0_21:match("^\\device\\harddiskvolume(.*)\\windows")
    if l_0_102 ~= nil then
      return 1
    end
  end
end
if l_0_0(l_0_17, ".log") or l_0_0(l_0_17, ".log1") or l_0_0(l_0_17, ".log2") or l_0_0(l_0_17, ".cat") or l_0_0(l_0_17, ".sqm") or l_0_0(l_0_17, ".etl") or l_0_0(l_0_17, ".db") or l_0_0(l_0_17, ".db3") or l_0_0(l_0_17, ".db-wal") or l_0_0(l_0_17, ".db3-wal") or l_0_0(l_0_17, ".db-journal") or l_0_0(l_0_17, ".db3-journal") or l_0_0(l_0_17, ".bin") or l_0_0(l_0_17, ".dat") or l_0_0(l_0_17, ".dmp") or l_0_0(l_0_17, ".data") or l_0_0(l_0_17, ".mui") or l_0_0(l_0_17, ".edb") or l_0_0(l_0_17, ".chk") or l_0_0(l_0_17, ".ini") or l_0_0(l_0_17, ".evtx") or l_0_0(l_0_17, ".manifest") or l_0_0(l_0_17, ".hve") or l_0_0(l_0_17, ".tmp.xml") or l_0_0(l_0_17, ".tmp.werinternalmetadata.xml") or l_0_0(l_0_17, ".hdmp") or l_0_0(l_0_17, ".dmp") or l_0_0(l_0_17, ".wer") or l_0_0(l_0_17, ".sdb") or l_0_0(l_0_17, ".tmp.appcompat.txt") then
  if l_0_13 == 4 then
    local l_0_103 = skip.get_contextdata(39)
    if not l_0_103 or l_0_103 == "" then
      return 1
    end
  end
  if l_0_20 == "svchost.exe" and l_0_17 == "gpt.ini" and l_0_12:match("^\\device\\mup\\") then
    return 0
  end
  if (l_0_20 == "processhacker.exe" or l_0_20 == "powershell.exe" or l_0_20 == "powershell_ise.exe" or l_0_20 == "dllhost.exe" or l_0_20 == "rundll32.exe") and l_0_0(l_0_17, ".dmp") then
    return 0
  end
  local l_0_104 = l_0_21:match("^\\device\\harddiskvolume(.*)\\windows\\system32")
  if l_0_104 == nil then
    l_0_104 = l_0_21:match("^\\\\%?\\volume{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}\\windows\\system32")
  end
  if l_0_104 ~= nil then
    return 1
  end
end
if l_0_20 == "firefox.exe" then
  local l_0_105, l_0_106, l_0_107 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\([^\\]*)\\mozilla\\firefox")
  if l_0_105 ~= nil and l_0_106 ~= nil and l_0_107 ~= nil then
    return 1
  end
  l_0_105 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files\\mozilla firefox")
  if l_0_105 ~= nil then
    l_0_105 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files\\mozilla firefox")
    if l_0_105 ~= nil then
      return 1
    end
    if l_0_0(l_0_17, ".mui") or l_0_0(l_0_17, ".ttf") or l_0_0(l_0_17, ".icm") or l_0_0(l_0_17, ".db") or l_0_0(l_0_17, ".bin") then
      return 1
    end
  end
end
local l_0_108 = string.find(l_0_20, ".", 1, true)
if l_0_108 == nil and (l_0_20 == "cp" or l_0_20 == "dash" or l_0_20 == "node" or l_0_20 == "npm" or l_0_20 == "grep" or l_0_20 == "cat" or l_0_20 == "dpkg" or l_0_20 == "dpkg-query" or l_0_20 == "sudo" or l_0_20 == "apt" or l_0_20 == "store" or l_0_20 == "apt-extracttemplates" or l_0_20 == "perl" or l_0_20 == "systemd-hwdb" or l_0_20 == "ldconfig" or l_0_20 == "update-alternatives") then
  local l_0_110 = (l_0_20 == "node" or l_0_20 == "npm") and l_0_2(l_0_17)
  if not l_0_110 then
    local l_0_111, l_0_112, l_0_113 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs")
    if l_0_111 ~= nil and l_0_112 ~= nil and l_0_113 ~= nil then
      local l_0_114, l_0_115, l_0_116 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs\\usr\\bin")
      if l_0_116 == nil then
        l_0_114, l_0_115, l_0_116 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\([^\\]*)\\localstate\\rootfs\\bin")
      end
      if l_0_111 == l_0_114 and l_0_112 == l_0_115 and l_0_113 == l_0_116 then
        return 1
      end
    end
  end
end
if l_0_20 == "firefox.exe" or l_0_20 == "gimp-2.8.exe" or l_0_20 == "soffice.bin" or l_0_20 == "chrome.exe" then
  local l_0_117, l_0_118 = l_0_12:match("^\\device\\harddiskvolume(.*)\\programdata\\ul\\pcmark 10\\chops\\dlc\\([^\\]*)\\")
  if l_0_117 ~= nil and l_0_118 ~= nil then
    local l_0_119, l_0_120 = l_0_21:match("^\\device\\harddiskvolume(.*)\\programdata\\ul\\pcmark 10\\chops\\dlc\\([^\\]*)\\")
    if l_0_117 == l_0_119 or l_0_118 == l_0_120 then
      return 1
    end
    l_0_119 = l_0_21:match("^\\device\\harddiskvolume(.*)\\programdata\\ul\\pcmark 10\\tmp")
    if l_0_119 == l_0_117 then
      return 1
    end
  end
end
if l_0_20 == "code.exe" or l_0_20 == "code - insiders.exe" then
  if string.find(l_0_12, "\\.vscode\\extensions\\", 1, true) ~= nil or string.find(l_0_12, "\\.vscode-insiders\\extensions\\", 1, true) ~= nil or string.find(l_0_12, "\\cachedextensionvsixs\\", 1, true) ~= nil or string.find(l_0_12, "tasks.json", 1, true) ~= nil then
    return 0
  end
  if l_0_6(l_0_21) and l_0_5(l_0_12) then
    return 1
  end
end
if l_0_20 == "devenv.exe" and l_0_7(l_0_21) then
  if string.find(l_0_12, "\\microsoft visual studio\\", 1, true) ~= nil and string.find(l_0_12, "\\extensions\\", 1, true) ~= nil or l_0_12:match("\\appdata\\local\\microsoft\\visualstudio\\[^\\]*\\extensions\\") ~= nil or l_0_0(l_0_17, ".vsix") then
    return 0
  end
  return 1
end
if l_0_20 == "rustup.exe" then
  local l_0_121, l_0_122 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.cargo\\bin")
  if l_0_121 ~= nil and l_0_122 ~= nil then
    local l_0_123, l_0_124 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.rustup\\")
    if l_0_123 == l_0_121 and l_0_124 == l_0_122 then
      return 1
    end
  end
end
if l_0_20 == "teams.exe" then
  local l_0_125, l_0_126 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\teams")
  if l_0_125 ~= nil and l_0_126 ~= nil then
    local l_0_127, l_0_128 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\roaming\\microsoft\\teams")
    if l_0_127 == l_0_125 and l_0_128 == l_0_126 then
      return 1
    end
    local l_0_129, l_0_130 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\microsoft\\teams")
    if l_0_129 == l_0_125 and l_0_130 == l_0_126 then
      return 1
    end
  end
end
if l_0_20 == "dllhost.exe" and l_0_0(l_0_21, "\\windows\\system32") then
  local l_0_131, l_0_132 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\microsoftwindows.client.cbs_cw5n1h2txyewy\\appdata\\cachestorage")
  if l_0_131 ~= nil and l_0_132 ~= nil then
    return 1
  end
  l_0_131, l_0_132 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\microsoftwindows.client_cw5n1h2txyewy\\appdata\\cachestorage")
  if l_0_131 ~= nil and l_0_132 ~= nil then
    return 1
  end
end
if l_0_20 == "notepad.exe" then
  local l_0_133, l_0_134 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files\\windowsapps\\microsoft.windowsnotepad_([^\\]*)__8wekyb3d8bbwe\\notepad\\notepad.exe$")
  if l_0_133 ~= nil then
    local l_0_135, l_0_136 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\packages\\microsoft.windowsnotepad_8wekyb3d8bbwe\\localstate\\tabstate\\")
    if l_0_135 == l_0_133 and l_0_136 ~= nil then
      return 1
    end
    local l_0_137, l_0_138 = l_0_12:match("^\\device\\harddiskvolume(.*)\\program files\\windowsapps\\microsoft.windowsnotepad_([^\\]*)__8wekyb3d8bbwe\\notepadxamlui\\")
    if l_0_137 == l_0_133 and l_0_138 == l_0_134 then
      return 1
    end
  end
end
if (l_0_20 == "_conda.exe" or l_0_20 == "python.exe" or l_0_20 == "pythonw.exe") and not l_0_3(l_0_17) and not l_0_39 then
  local l_0_139, l_0_140 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\miniconda%d")
  if l_0_139 ~= nil and l_0_140 ~= nil then
    local l_0_141, l_0_142 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\miniconda%d\\")
    if l_0_141 == l_0_139 and l_0_142 == l_0_140 then
      return 1
    end
  end
  l_0_139, l_0_140 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\anaconda%d")
  if l_0_139 ~= nil and l_0_140 ~= nil then
    local l_0_143, l_0_144 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\anaconda%d\\")
    if l_0_143 == l_0_139 and l_0_144 == l_0_140 then
      return 1
    end
  end
  l_0_139 = l_0_21:match("^\\device\\harddiskvolume(.*)\\programdata\\miniconda%d")
  if l_0_139 ~= nil then
    local l_0_145 = l_0_12:match("^\\device\\harddiskvolume(.*)\\programdata\\miniconda%d")
    if l_0_145 == l_0_139 then
      return 1
    end
  end
  l_0_139 = l_0_21:match("^\\device\\harddiskvolume(.*)\\programdata\\anaconda%d")
  if l_0_139 ~= nil then
    local l_0_146 = l_0_12:match("^\\device\\harddiskvolume(.*)\\programdata\\anaconda%d")
    if l_0_146 == l_0_139 then
      return 1
    end
  end
end
if l_0_20 == "machinelocalwatchdog.exe" and l_0_17:match("^%w*$") ~= nil then
  return 1
end
if l_0_20 == "savservice.exe" and l_0_17:match("^%w*$") ~= nil then
  return 1
end
if (l_0_20 == "postgres.exe" or l_0_20 == "postgresinstanceagentrunnerhost.exe") and l_0_17:match("^%w*$") ~= nil then
  return 1
end
if l_0_20 == "javaw.exe" or l_0_20 == "java.exe" or l_0_20 == "javac.exe" then
  local l_0_147, l_0_148, l_0_149 = l_0_21:match("^\\device\\harddiskvolume(.*)\\(.*)\\java\\jdk([^\\]*)\\bin")
  if l_0_147 ~= nil and l_0_148 ~= nil and l_0_149 ~= nil then
    local l_0_150, l_0_151 = l_0_12:match("^\\device\\harddiskvolume(.*)\\(.*)\\eclipse\\%d+.%d+\\")
    if l_0_150 == l_0_147 and l_0_151 == l_0_148 then
      return 1
    end
    local l_0_152, l_0_153 = l_0_12:match("^\\device\\harddiskvolume(.*)\\(.*)\\java\\gwdlso\\")
    if l_0_152 == l_0_147 and l_0_153 == l_0_148 then
      return 1
    end
  end
end
if l_0_20 == "svchost.exe" or l_0_20 == "lsass.exe" or l_0_20 == "services.exe" or l_0_20 == "taskhostw.exe" then
  local l_0_154 = l_0_21:match("^\\\\%?\\volume(.*)\\windows\\system32")
  if l_0_154 ~= nil then
    local l_0_155 = l_0_12:match("^\\device\\vhdharddisk(.*)\\windows")
    if l_0_155 == l_0_154 then
      return 1
    end
    local l_0_156 = l_0_12:match("^\\device\\vhdharddisk(.*)\\programdata")
    if l_0_156 == l_0_154 then
      return 1
    end
    local l_0_157 = l_0_12:match("^\\device\\harddiskvolume(.*)\\windows")
    if l_0_157 ~= nil then
      return 1
    end
    local l_0_158 = l_0_12:match("^\\device\\harddiskvolume(.*)\\programdata")
    if l_0_158 ~= nil then
      return 1
    end
  end
end
if l_0_20 == "fusion360.exe" then
  local l_0_159, l_0_160 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\autodesk\\webdeploy\\production")
  if l_0_159 ~= nil and l_0_160 ~= nil then
    local l_0_161, l_0_162 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\autodesk\\webdeploy\\production\\")
    if l_0_161 == l_0_159 and l_0_162 == l_0_160 then
      return 1
    end
    l_0_161, l_0_162 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\fusionstreamer\\")
    if l_0_161 == l_0_159 and l_0_162 == l_0_160 then
      return 1
    end
  end
end
if l_0_20 == "node.exe" and not l_0_2(l_0_17) then
  local l_0_163 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files\\")
  if l_0_163 == nil then
    l_0_163 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files(x86)\\")
  end
  if l_0_163 ~= nil then
    return 1
  end
end

local function l_0_164()
  if l_0_8 ~= skip.SCANREASON_ONOPEN and l_0_8 ~= skip.SCANREASON_ONMODIFIEDHANDLECLOSE or skip.get_contextdata(skip.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) or l_0_8 == skip.SCANREASON_ONMODIFIEDHANDLECLOSE and skip.IsHipsRuleEnabled("56a863a9-875e-4185-98a7-b882c64b5ce5") then
    return false
  end
  local l_10_0
  if l_0_20 == "nuget.exe" or l_0_20 == "dotnet.exe" or l_0_20 == "msbuild.exe" then
    l_10_0 = "nuget"
  elseif l_0_20 == "java.exe" or l_0_20 == "javaw.exe" or l_0_20 == "javac.exe" then
    l_10_0 = "java"
  elseif l_0_20 == "cargo.exe" or l_0_20 == "rustup.exe" then
    l_10_0 = "rust"
  elseif l_0_20 == "go.exe" then
    l_10_0 = "go"
  elseif l_0_20 == "python.exe" or l_0_20 == "pythonw.exe" or l_0_20 == "pip.exe" or l_0_20 == "pip3.exe" or l_0_20 == "uv.exe" or l_0_20 == "uvx.exe" or l_0_20 == "_conda.exe" or l_0_20 == "conda.exe" then
    l_10_0 = "python"
  elseif l_0_20 == "ruby.exe" or l_0_20 == "rubyw.exe" or l_0_20 == "gem.exe" then
    l_10_0 = "ruby"
  elseif l_0_20 == "php.exe" or l_0_20 == "php-cgi.exe" then
    l_10_0 = "php"
  elseif l_0_20 == "r.exe" or l_0_20 == "rterm.exe" or l_0_20 == "rgui.exe" or l_0_20 == "rcmd.exe" then
    l_10_0 = "r"
  else
    return false
  end
  if l_0_17 == "" or l_0_17:find("[\\/:]") then
    return false
  end
  local l_10_1, l_10_2, l_10_3 = l_0_12:match("^\\device\\harddiskvolume(%d+)\\users\\([^\\]+)\\(.+)$")
  if l_10_1 == nil then
    return false
  end
  local l_10_4, l_10_5, l_10_6 = l_0_21:match("^\\device\\harddiskvolume(%d+)\\users\\([^\\]+)\\(.+)$")
  local l_10_8 = l_10_4 ~= nil
  if l_10_8 then
    if l_10_4 ~= l_10_1 or l_10_5 ~= l_10_2 then
      return false
    end
  else
    l_10_4, l_10_6 = l_0_21:match("^\\device\\harddiskvolume(%d+)\\program files\\(.+)$")
    if l_10_4 == nil then
      l_10_4, l_10_6 = l_0_21:match("^\\device\\harddiskvolume(%d+)\\program files %(x86%)\\(.+)$")
    end
    if l_10_4 ~= l_10_1 then
      return false
    end
  end
  local l_10_9 = false
  if l_10_0 == "nuget" then
    if l_0_20 == "dotnet.exe" then
      l_10_9 = l_10_6 == (l_10_8 and ".dotnet" or "dotnet")
    elseif l_0_20 == "nuget.exe" then
      l_10_9 = l_10_6 == (l_10_8 and ".nuget" or "nuget")
    elseif not l_10_8 then
      local l_10_10 = l_10_6:match("^microsoft visual studio\\[^\\]+\\[^\\]+\\msbuild\\[^\\]+\\(.+)$") or l_10_6:match("^msbuild\\[%d.]+\\(.+)$")
      l_10_9 = l_10_10 == "bin" or l_10_10 == "bin\\amd64" or l_10_10 == "bin\\arm64"
    end
  elseif l_10_0 == "java" then
    if l_10_8 then
      l_10_9 = l_10_6:match("^%.jdks\\[^\\]+\\bin$") ~= nil or l_10_6:match("^appdata\\local\\programs\\eclipse adoptium\\jdk[^\\]+\\bin$") ~= nil
    else
      l_10_9 = l_10_6:match("^java\\jdk[^\\]+\\bin$") ~= nil or l_10_6:match("^eclipse adoptium\\jdk[^\\]+\\bin$") ~= nil or l_10_6:match("^microsoft\\jdk[^\\]+\\bin$") ~= nil or l_10_6:match("^amazon corretto\\jdk[^\\]+\\bin$") ~= nil
    end
  elseif l_10_0 == "rust" then
    l_10_9 = l_10_8 and (l_10_6 == ".cargo\\bin" or l_10_6:match("^%.rustup\\toolchains\\[^\\]+\\bin$") ~= nil)
  elseif l_10_0 == "go" then
    l_10_9 = not l_10_8 and l_10_6 == "go\\bin" or l_10_8 and l_10_6:match("^sdk\\go%d[%d.]+\\bin$") ~= nil
  elseif l_10_0 == "python" then
    if l_0_20 == "uv.exe" or l_0_20 == "uvx.exe" then
      l_10_9 = l_10_8 and (l_10_6 == ".local\\bin" or l_10_6 == ".cargo\\bin") or not l_10_8 and l_10_6 == "uv"
    else
      local l_10_12 = l_10_8 and l_10_6:match("^appdata\\local\\programs\\python\\(.+)$") or not l_10_8 and l_10_6
      if l_10_12 then
        if l_0_20 == "pip.exe" or l_0_20 == "pip3.exe" then
          l_10_9 = l_10_12:match("^python%d+\\scripts$") ~= nil
        elseif l_0_20 == "python.exe" or l_0_20 == "pythonw.exe" then
          l_10_9 = l_10_12:match("^python%d+$") ~= nil
        end
      end
      local l_10_13 = l_10_6:match("^miniconda%d+(.*)$") or l_10_6:match("^anaconda%d+(.*)$")
      if l_10_13 then
        l_10_9 = l_10_13 == "" or l_10_13 == "\\scripts" or l_10_13:match("^\\envs\\[^\\]+$") ~= nil or l_10_13:match("^\\envs\\[^\\]+\\scripts$") ~= nil
      end
    end
  elseif l_10_0 == "ruby" then
    local l_10_15 = l_10_8 and l_10_6:match("^appdata\\local\\programs\\(.+)$") or not l_10_8 and l_10_6
    l_10_9 = l_10_15 and l_10_15:match("^ruby%d[%w.%-]*\\bin$") ~= nil or l_10_8 and l_10_6:match("^%.rubies\\ruby%-%d[%w.%-]*\\bin$") ~= nil
  elseif l_10_0 == "php" then
    local l_10_17 = l_10_8 and l_10_6:match("^appdata\\local\\programs\\(.+)$") or not l_10_8 and l_10_6
    l_10_9 = l_10_17 and (l_10_17 == "php" or l_10_17:match("^php%d[%d.]*$") ~= nil)
  elseif l_10_0 == "r" then
    local l_10_19 = l_10_8 and l_10_6:match("^appdata\\local\\programs\\(.+)$") or not l_10_8 and l_10_6
    local l_10_20 = l_10_19 and l_10_19:match("^r\\r%-%d[%d.]+\\(.+)$")
    l_10_9 = l_10_20 == "bin" or l_10_20 == "bin\\x64" or l_10_20 == "bin\\i386"
  end
  if not l_10_9 then
    return false
  end
  if l_10_0 == "nuget" then
    return l_10_3 == "appdata\\local\\temp\\nugetscratch\\lock" and #l_0_17 == 40 and l_0_17:match("^%x+$") ~= nil
  elseif l_10_0 == "java" then
    if l_10_3:match("^%.gradle\\daemon\\[^\\]+$") then
      return l_0_17:match("^daemon%-%d+%.out%.log$") ~= nil or l_0_17 == "registry.bin.lock"
    elseif l_10_3:match("^%.m2\\repository\\[^\\]+\\.+$") then
      return l_0_17 == "_remote.repositories" or l_0_17:match("^[a-z0-9_.%-]+%.lastupdated$") ~= nil
    end
  elseif l_10_0 == "rust" then
    return l_10_3 == ".cargo" and (l_0_17 == ".package-cache" or l_0_17 == ".package-cache-mutate")
  elseif l_10_0 == "go" then
    if l_10_3:match("^go\\pkg\\mod\\cache\\download\\.+\\@v$") then
      return l_0_17:match("^v%d[a-z0-9_.+%-]*%.lock$") ~= nil
    end
    return l_10_3 == "appdata\\local\\go-build" and l_0_17 == "trim.txt"
  elseif l_10_0 == "python" then
    if l_10_3 == "appdata\\local\\uv\\cache" then
      return l_0_17 == ".lock" or l_0_17 == "cachedir.tag"
    elseif l_10_3 == "appdata\\local\\pip\\cache\\selfcheck" then
      return #l_0_17 == 56 and l_0_17:match("^%x+$") ~= nil or #l_0_17 == 68 and l_0_17:sub(1, 56):match("^%x+$") ~= nil and l_0_17:sub(57, 64):match("^[a-z0-9_]+$") ~= nil and l_0_17:sub(65) == ".tmp"
    end
    return l_10_3 == ".conda" and l_0_17 == "environments.txt"
  elseif l_10_0 == "ruby" then
    return l_0_17 == "gem_make.out" and (l_10_3:match("^%.gem\\ruby\\[^\\]+\\extensions\\[^\\]+\\[^\\]+\\[^\\]+$") ~= nil or l_10_3:match("^%.local\\share\\gem\\ruby\\[^\\]+\\extensions\\[^\\]+\\[^\\]+\\[^\\]+$") ~= nil)
  elseif l_10_0 == "php" then
    return l_10_3 == "appdata\\local\\temp" and l_0_17 == "php_errors.log"
  elseif l_10_0 == "r" then
    return 7 < #l_10_3 and l_10_3:sub(-7) == ".rcheck" and (l_0_17 == "00check.log" or l_0_17 == "00install.out")
  end
  return false
end

if versioning.IsSampled(5000, false, false, true) and l_0_164() then
  return 1
end
if l_0_20 == "irsetup.exe" and l_0_17 == "ultraedit setup log.txt" then
  local l_0_165, l_0_166, l_0_167 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\([^\\]*)")
  if l_0_165 ~= nil and l_0_166 ~= nil and l_0_167 ~= nil then
    local l_0_168, l_0_169 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp")
    if l_0_168 == l_0_165 and l_0_169 == l_0_166 then
      return 1
    end
  end
end
if l_0_17 == "update.log" and (l_0_20 == "blackdesertlauncher.exe" or l_0_20 == "blackdesertpatcher32.pae") then
  local l_0_170 = l_0_21:match("^\\device\\harddiskvolume(.*)\\pearlabyss\\blackdesert")
  if l_0_170 ~= nil then
    local l_0_171 = l_0_12:match("^\\device\\harddiskvolume(.*)\\pearlabyss\\blackdesert")
    if l_0_171 == l_0_170 then
      return 1
    end
  end
end
if l_0_20 == "dismhost.exe" then
  local l_0_172 = l_0_21:match("^\\device\\harddiskvolume(.*)\\$winreagent")
  if l_0_172 ~= nil then
    local l_0_173 = l_0_12:match("^\\device\\harddiskvolume(.*)\\$winreagent")
    if l_0_173 == l_0_172 then
      return 1
    end
  end
end
if l_0_20 == "resharper.backend64c.exe" or l_0_20 == "ext-services64.exe" or l_0_20 == "jetbrains.platform.stackcapturer64c.exe" or l_0_20 == "jetbrains.dpa.protocol.backend.exe" then
  local l_0_174, l_0_175, l_0_176 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\jetbrains\\([^\\]*)")
  if l_0_174 == nil or l_0_175 == nil or l_0_176 == nil then
    l_0_174, l_0_175, l_0_176 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\temp\\jetbrains\\([^\\]*)")
  end
  if l_0_174 ~= nil and l_0_175 ~= nil and l_0_176 ~= nil then
    local l_0_177, l_0_178 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\jetbrains")
    if l_0_177 == l_0_174 and l_0_178 == l_0_175 then
      return 1
    end
    l_0_177, l_0_178 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\source")
    if l_0_177 == l_0_174 and l_0_178 == l_0_175 then
      return 1
    end
    l_0_177, l_0_178 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.nuget")
    if l_0_177 == l_0_174 and l_0_178 == l_0_175 then
      return 1
    end
  end
end
if l_0_20 == "pycharm64.exe" then
  local l_0_179, l_0_180, l_0_181 = l_0_21:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\programs\\pycharm([^\\]*)\\bin")
  if l_0_179 ~= nil and l_0_180 ~= nil and l_0_181 ~= nil then
    local l_0_182, l_0_183 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\appdata\\local\\jetbrains")
    if l_0_182 == l_0_179 and l_0_183 == l_0_180 then
      return 1
    end
  end
end
if l_0_20 == "dotnet.exe" or l_0_20 == "vbcscompiler.exe" or l_0_20 == "csc.exe" or l_0_20 == "vbc.exe" or l_0_20 == "dotnet-format.exe" then
  local l_0_184 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files\\dotnet\\")
  if l_0_184 == nil then
    l_0_184 = l_0_21:match("^\\device\\harddiskvolume(.*)\\program files(x86)\\dotnet\\")
  end
  if l_0_184 ~= nil then
    local l_0_185, l_0_186 = l_0_12:match("^\\device\\harddiskvolume(.*)\\users\\([^\\]*)\\.copilot")
    if l_0_185 == l_0_184 and l_0_186 ~= nil then
      return 1
    end
  end
end
return 0
