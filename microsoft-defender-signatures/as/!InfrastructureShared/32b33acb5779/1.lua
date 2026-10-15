-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b33acb5779\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if not l_0_0 or not l_0_0.matched then
  return mp.CLEAN
end
if l_0_0.utf8p1 ~= "AIDiscoveryCustom_ClaudeAgentSDKPy" then
  return mp.CLEAN
end
local l_0_1 = function(l_1_0)
  -- function num : 0_0
  if type(l_1_0) ~= "string" or l_1_0 == "" or #l_1_0 > 4096 then
    return nil
  end
  l_1_0 = (MpCommon.PathToWin32Path)(l_1_0)
  if type(l_1_0) ~= "string" or l_1_0 == "" then
    return nil
  end
  local l_1_1 = string.lower
  do
    local l_1_2, l_1_3, l_1_4, l_1_5 = (string.gsub)(l_1_0, "/", "\\"), .end
    do return l_1_1(l_1_2, l_1_3, l_1_4, l_1_5) end
    -- DECOMPILER ERROR at PC36: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

local l_0_2 = l_0_1((bm.get_imagepath)())
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (sysio.GetPEVersionInfo)(l_0_2)
if not l_0_3 or l_0_3.CompanyName ~= "Python Software Foundation" or l_0_3.ProductName ~= "Python" or type(l_0_3.OriginalFilename) ~= "string" then
  return mp.CLEAN
end
local l_0_4 = (string.lower)(l_0_3.OriginalFilename)
if l_0_4 ~= "python.exe" and l_0_4 ~= "pythonw.exe" then
  return mp.CLEAN
end
local l_0_5 = l_0_1(l_0_0.utf8p2)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = (string.match)(l_0_5, "^(.*)\\claude_agent_sdk\\_internal\\transport\\")
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = (string.match)(l_0_6, "^(.*)\\lib\\site%-packages$")
if l_0_7 then
  l_0_6 = l_0_7
  local l_0_8, l_0_9 = (string.match)(l_0_6, "^(.*)\\([^\\]+)$")
  if l_0_9 == ".venv" or l_0_9 == "venv" or l_0_9 == ".env" or l_0_9 == "env" then
    l_0_6 = l_0_8
  end
else
end
do
  if not (string.match)(l_0_6, "^(.*)\\src$") then
    local l_0_10 = {}
    l_0_10.windows = true
    l_0_10["program files"] = true
    l_0_10["program files (x86)"] = true
    l_0_10.programdata = true
    l_0_10.appdata = true
    l_0_10.cache = true
    l_0_10.caches = true
    l_0_10[".cache"] = true
    l_0_10.temp = true
    l_0_10.tmp = true
    l_0_10[".tox"] = true
    l_0_10[".nox"] = true
    l_0_10["site-packages"] = true
    l_0_10["dist-packages"] = true
    for l_0_14 in (string.gmatch)(l_0_6, "[^\\]+") do
      if l_0_10[l_0_14] or l_0_14 == "." or l_0_14 == ".." then
        return mp.CLEAN
      end
    end
    if not (string.match)(l_0_6, "^%a:\\") and not (string.match)(l_0_6, "^\\\\[^\\]+\\[^\\]+\\[^\\]+") then
      return mp.CLEAN
    end
    if (string.match)(l_0_6, "^%a:\\users\\[^\\]+$") then
      return mp.CLEAN
    end
    local l_0_15 = (string.match)(l_0_6, "\\([^\\]+)$")
    local l_0_16 = {}
    l_0_16.python = true
    l_0_16.pypy = true
    l_0_16.lib = true
    l_0_16.src = true
    l_0_16.bin = true
    l_0_16.scripts = true
    l_0_16.tools = true
    l_0_16.users = true
    l_0_16.public = true
    l_0_16.desktop = true
    l_0_16.documents = true
    l_0_16.downloads = true
    l_0_16.projects = true
    l_0_16.repos = true
    l_0_16.workspace = true
    l_0_16.workspaces = true
    l_0_16.env = true
    l_0_16[".env"] = true
    l_0_16.envs = true
    l_0_16.venv = true
    l_0_16[".venv"] = true
    l_0_16.venvs = true
    l_0_16.environments = true
    l_0_16.base = true
    l_0_16.default = true
    l_0_16[".conda"] = true
    l_0_16.anaconda3 = true
    l_0_16.miniconda3 = true
    if not l_0_15 or l_0_16[l_0_15] or (string.match)(l_0_15, "^python%d") or (string.match)(l_0_15, "^python[%-%_]%d") or (string.match)(l_0_15, "^cpython%-") or #l_0_15 >= 16 and not (string.find)(l_0_15, "[^%x%-]") then
      return mp.CLEAN
    end
    local l_0_17 = function(l_2_0)
  -- function num : 0_1
  if type(l_2_0) ~= "string" or l_2_0 == "" or #l_2_0 > 32768 then
    return "unavailable"
  end
  local l_2_1 = (MpCommon.CommandLineToArgv)(l_2_0)
  if type(l_2_1) ~= "table" or #l_2_1 == 0 then
    return "unavailable"
  end
  local l_2_2 = 2
  while 1 do
    while 1 do
      if l_2_2 <= #l_2_1 then
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
        if (string.sub)(l_2_3, 1, 1) ~= "-" then
          return "script", l_2_3
        end
        if l_2_3 == "--check-hash-based-pycs" then
          do
            local l_2_4 = l_2_1[l_2_2 + 1]
            if l_2_4 ~= "default" and l_2_4 ~= "always" and l_2_4 ~= "never" then
              return "unavailable"
            end
            l_2_2 = l_2_2 + 2
            -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC78: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    if (string.sub)(l_2_3, 1, 2) == "--" then
      return "unavailable"
    end
    for l_2_8 = 2, #l_2_3 do
      local l_2_9 = (string.sub)(l_2_3, l_2_8, l_2_8)
      if l_2_9 == "c" then
        return "inline"
      end
      if l_2_9 == "m" or l_2_9 == "W" or l_2_9 == "X" then
        if (string.sub)(l_2_3, l_2_8 + 1) == "" then
          l_2_2 = l_2_2 + 1
          local l_2_10, l_2_11 = l_2_1[l_2_2]
        end
        do
          do
            -- DECOMPILER ERROR at PC118: Confused about usage of register: R9 in 'UnsetPending'

            -- DECOMPILER ERROR at PC120: Confused about usage of register: R9 in 'UnsetPending'

            if not l_2_10 or l_2_10 == "" then
              return "unavailable"
            end
            -- DECOMPILER ERROR at PC127: Confused about usage of register: R9 in 'UnsetPending'

            if l_2_9 == "m" then
              return "module", l_2_10
            end
            do break end
            if not (string.find)("bBdEiIOPqRsSuvx", l_2_9, 1, true) then
              return "unavailable"
            end
            -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC141: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    l_2_2 = l_2_2 + 1
  end
  do
    return "stdin_or_interactive"
  end
end

    local l_0_18 = (bm.get_current_process_startup_info)()
    if type(l_0_18) ~= "table" or not l_0_18.ppid then
      return mp.CLEAN
    end
    local l_0_19, l_0_20 = l_0_17(l_0_18.command_line)
    local l_0_21 = {}
    l_0_21.sdk = "claude-agent-sdk"
    l_0_21.language = "python"
    l_0_21.evidence = "on_open_scan"
    l_0_21.module = "subprocess_cli"
    l_0_21.ruleRevision = 2
    l_0_21.runtime = "cpython"
    l_0_21.sdkPath = l_0_5
    l_0_21.projectPath = l_0_6
    l_0_21.projectName = l_0_15
    l_0_21.projectSource = "sdk_path"
    l_0_21.entryPointKind = l_0_19
    if l_0_20 and l_0_20 ~= "" and #l_0_20 <= 4096 then
      l_0_21.entryPoint = l_0_20
      if (not (string.match)(l_0_20, "^%a:[\\/]") and not (string.match)(l_0_20, "^[\\/][\\/]")) or not "absolute" then
        l_0_21.entryPointPathKind = l_0_19 ~= "script" or "relative"
        local l_0_22 = safeJsonSerialize(l_0_21)
        if not l_0_22 or #l_0_22 >= 30720 then
          return mp.CLEAN
        end
        ;
        (bm.set_detection_string)(l_0_22)
        return mp.INFECTED
      end
    end
  end
end

