-- Threat: !InfrastructureShared
-- Name: 32b3e0beec7d
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = this_sigattrlog[1]
if not l_0_0 or not l_0_0.matched then
  return mp.CLEAN
end
local l_0_1 = {
  AIDiscoveryCustom_ClaudeAgentSDKPy = {
    sdk = "claude-agent-sdk",
    module = "subprocess_cli",
    revision = 2,
    package_pattern = "^(.*)\\claude_agent_sdk\\_internal\\transport\\"
  },
  AIDiscoveryCustom_MicrosoftAgentFrameworkPy = {
    sdk = "agent-framework-core",
    module = "_telemetry",
    revision = 1,
    package_pattern = "^(.*)\\agent_framework\\"
  },
  AIDiscoveryCustom_LangChainPy = {
    sdk = "langchain",
    module = "agents.__init__",
    revision = 1,
    package_pattern = "^(.*)\\langchain\\agents\\"
  },
  AIDiscoveryCustom_OpenAIAgentsSDKPy = {
    sdk = "openai-agents",
    module = "openai_provider",
    revision = 1,
    package_pattern = "^(.*)\\agents\\models\\"
  },
  AIDiscoveryCustom_GoogleADKPy = {
    sdk = "google-adk",
    module = "utils._client_labels_utils",
    revision = 2,
    package_pattern = "^(.*)\\google\\adk\\utils\\"
  }
}
local l_0_2 = l_0_1[l_0_0.utf8p1]
if not l_0_2 then
  return mp.CLEAN
end

local function l_0_3(l_1_0)
  if type(l_1_0) ~= "string" or l_1_0 == "" or 4096 < #l_1_0 then
    return nil
  end
  l_1_0 = MpCommon.PathToWin32Path(l_1_0)
  if type(l_1_0) ~= "string" or l_1_0 == "" then
    return nil
  end
  return string.lower(string.gsub(l_1_0, "/", "\\"))
end

local l_0_4 = l_0_3(bm.get_imagepath())
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = sysio.GetPEVersionInfo(l_0_4)
if not l_0_5 or l_0_5.CompanyName ~= "Python Software Foundation" or l_0_5.ProductName ~= "Python" or type(l_0_5.OriginalFilename) ~= "string" then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_5.OriginalFilename)
if l_0_6 ~= "python.exe" and l_0_6 ~= "pythonw.exe" then
  return mp.CLEAN
end
local l_0_7 = l_0_3(l_0_0.utf8p2)
if not l_0_7 then
  return mp.CLEAN
end
local l_0_8 = string.match(l_0_7, l_0_2.package_pattern)
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = string.match(l_0_8, "^(.*)\\lib\\site%-packages$")
if l_0_9 then
  l_0_8 = l_0_9
  local l_0_10, l_0_11 = string.match(l_0_8, "^(.*)\\([^\\]+)$")
  if l_0_11 == ".venv" or l_0_11 == "venv" or l_0_11 == ".env" or l_0_11 == "env" then
    l_0_8 = l_0_10
  end
else
  l_0_8 = string.match(l_0_8, "^(.*)\\src$") or l_0_8
end
local l_0_12 = {
  windows = true,
  ["program files"] = true,
  ["program files (x86)"] = true,
  programdata = true,
  appdata = true,
  cache = true,
  caches = true,
  [".cache"] = true,
  temp = true,
  tmp = true,
  [".tox"] = true,
  [".nox"] = true,
  ["site-packages"] = true,
  ["dist-packages"] = true
}
for l_0_13 in string.gmatch(l_0_8, "[^\\]+") do
  if l_0_12[l_0_13] or l_0_13 == "." or l_0_13 == ".." then
    return mp.CLEAN
  end
end
if not string.match(l_0_8, "^%a:\\") and not string.match(l_0_8, "^\\\\[^\\]+\\[^\\]+\\[^\\]+") then
  return mp.CLEAN
end
if string.match(l_0_8, "^%a:\\users\\[^\\]+$") then
  return mp.CLEAN
end
local l_0_14 = string.match(l_0_8, "\\([^\\]+)$")
local l_0_15 = {
  python = true,
  pypy = true,
  lib = true,
  src = true,
  bin = true,
  scripts = true,
  tools = true,
  users = true,
  public = true,
  desktop = true,
  documents = true,
  downloads = true,
  projects = true,
  repos = true,
  workspace = true,
  workspaces = true,
  env = true,
  [".env"] = true,
  envs = true,
  venv = true,
  [".venv"] = true,
  venvs = true,
  environments = true,
  base = true,
  default = true,
  [".conda"] = true,
  anaconda3 = true,
  miniconda3 = true
}
if not l_0_14 or l_0_15[l_0_14] or string.match(l_0_14, "^python%d") or string.match(l_0_14, "^python[%-%_]%d") or string.match(l_0_14, "^cpython%-") or 16 <= #l_0_14 and not string.find(l_0_14, "[^%x%-]") then
  return mp.CLEAN
end

local function l_0_16(l_2_0)
  if type(l_2_0) ~= "string" or l_2_0 == "" or 32768 < #l_2_0 then
    return "unavailable"
  end
  local l_2_1 = MpCommon.CommandLineToArgv(l_2_0)
  if type(l_2_1) ~= "table" or #l_2_1 == 0 then
    return "unavailable"
  end
  local l_2_2 = 2
  while l_2_2 <= #l_2_1 do
    local l_2_3 = l_2_1[l_2_2]
    if l_2_3 == "-" then
      return "stdin"
    end
    if l_2_3 == "--" then
      if l_2_1[l_2_2 + 1] == "-" then
        return "stdin"
      end
      return l_2_1[l_2_2 + 1] and "script" or "stdin_or_interactive", l_2_1[l_2_2 + 1]
    end
    if string.sub(l_2_3, 1, 1) ~= "-" then
      return "script", l_2_3
    end
    if l_2_3 == "--check-hash-based-pycs" then
      do
        local l_2_4 = l_2_1[l_2_2 + 1]
        if l_2_4 ~= "default" and l_2_4 ~= "always" and l_2_4 ~= "never" then
          return "unavailable"
        end
        l_2_2 = l_2_2 + 2
      end
    else
      if string.sub(l_2_3, 1, 2) == "--" then
        return "unavailable"
      end
      for l_2_5 = 2, #l_2_3 do
        local l_2_6 = string.sub(l_2_3, l_2_5, l_2_5)
        if l_2_6 == "c" then
          return "inline"
        end
        if l_2_6 == "m" or l_2_6 == "W" or l_2_6 == "X" then
          local l_2_7 = string.sub(l_2_3, l_2_5 + 1)
          if l_2_7 == "" then
            l_2_2 = l_2_2 + 1
            l_2_7 = l_2_1[l_2_2]
          end
          if not l_2_7 or l_2_7 == "" then
            return "unavailable"
          end
          if l_2_6 == "m" then
            return "module", l_2_7
          end
          break
        end
        if not string.find("bBdEiIOPqRsSuvx", l_2_6, 1, true) then
          return "unavailable"
        end
      end
      l_2_2 = l_2_2 + 1
    end
  end
  return "stdin_or_interactive"
end

local l_0_17 = bm.get_current_process_startup_info()
if type(l_0_17) ~= "table" or not l_0_17.ppid then
  return mp.CLEAN
end
local l_0_18, l_0_19 = l_0_16(l_0_17.command_line)
local l_0_20 = {
  sdk = l_0_2.sdk,
  language = "python",
  evidence = "on_open_scan",
  module = l_0_2.module,
  ruleRevision = l_0_2.revision,
  runtime = "cpython",
  sdkPath = l_0_7,
  projectPath = l_0_8,
  projectName = l_0_14,
  projectSource = "sdk_path",
  entryPointKind = l_0_18
}
if l_0_19 and l_0_19 ~= "" and #l_0_19 <= 4096 then
  l_0_20.entryPoint = l_0_19
  if l_0_18 == "script" then
    l_0_20.entryPointPathKind = (string.match(l_0_19, "^%a:[\\/]") or string.match(l_0_19, "^[\\/][\\/]")) and "absolute" or "relative"
  end
end
local l_0_21 = safeJsonSerialize(l_0_20)
if not l_0_21 or 30720 <= #l_0_21 then
  return mp.CLEAN
end
bm.set_detection_string(l_0_21)
return mp.INFECTED
