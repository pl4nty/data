-- Threat: !InfrastructureShared
-- Name: 33d7ca897704
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if type(l_0_1) ~= "string" or l_0_1 == "" or 32768 < #l_0_1 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.CommandLineToArgv(l_0_1)
if type(l_0_2) ~= "table" or next(l_0_2) == nil then
  return mp.CLEAN
end

local function l_0_3(l_1_0)
  return string.match(string.lower(l_1_0), "[^\\/]+$") or ""
end

local l_0_4 = l_0_3(l_0_2[1])
local l_0_5 = {
  node = "node",
  ["node.exe"] = "node",
  npm = "npm",
  ["npm.cmd"] = "npm",
  ["npm.ps1"] = "npm",
  npx = "npx",
  ["npx.cmd"] = "npx",
  ["npx.ps1"] = "npx",
  pnpm = "pnpm",
  ["pnpm.exe"] = "pnpm",
  ["pnpm.cmd"] = "pnpm",
  ["pnpm.ps1"] = "pnpm",
  yarn = "yarn",
  ["yarn.cmd"] = "yarn",
  ["yarn.ps1"] = "yarn",
  bun = "bun",
  ["bun.exe"] = "bun",
  bunx = "bunx",
  ["bunx.exe"] = "bunx"
}
local l_0_6 = l_0_5[l_0_4]
local l_0_7 = 2
if l_0_6 == "node" then
  if type(l_0_2[2]) ~= "string" then
    return mp.CLEAN
  end
  l_0_6 = ({
    ["npm-cli.js"] = "npm",
    ["npx-cli.js"] = "npx",
    ["pnpm.cjs"] = "pnpm",
    ["pnpm.js"] = "pnpm",
    ["yarn.js"] = "yarn",
    ["yarn.cjs"] = "yarn"
  })[l_0_3(l_0_2[2])]
  l_0_7 = 3
end
if l_0_6 ~= "npm" and l_0_6 ~= "npx" and l_0_6 ~= "pnpm" and l_0_6 ~= "yarn" and l_0_6 ~= "bun" and l_0_6 ~= "bunx" then
  return mp.CLEAN
end
local l_0_8 = {
  ["--prefix"] = true,
  ["--registry"] = true,
  ["--userconfig"] = true,
  ["--globalconfig"] = true,
  ["--cache"] = true,
  ["--filter"] = true,
  ["-F"] = true,
  ["--dir"] = true,
  ["-C"] = true,
  ["--cwd"] = true,
  ["--modules-folder"] = true,
  ["--store-dir"] = true,
  ["--virtual-store-dir"] = true,
  ["--lockfile-dir"] = true,
  ["--loglevel"] = true,
  ["--omit"] = true,
  ["--include"] = true,
  ["--tag"] = true,
  ["--access"] = true,
  ["--network-timeout"] = true,
  ["--mutex"] = true,
  ["--script-shell"] = true,
  ["--shell"] = true,
  ["--env-file"] = true,
  ["--package"] = true,
  ["--call"] = true,
  ["-c"] = true
}
local l_0_9 = {}
local l_0_10 = false
local l_0_11 = true
local l_0_12 = l_0_7
while l_0_12 <= #l_0_2 do
  local l_0_13 = l_0_2[l_0_12]
  if l_0_11 and l_0_13 == "--" then
    l_0_11 = false
  elseif l_0_11 and string.sub(l_0_13, 1, 1) == "-" then
    local l_0_14, l_0_15 = string.match(l_0_13, "^([^=]+)=(.*)$")
    l_0_14 = l_0_14 or l_0_13
    if l_0_14 == "--help" or l_0_14 == "-h" or l_0_14 == "--version" or l_0_14 == "-v" or l_0_14 == "--dry-run" or l_0_14 == "--package-lock-only" or l_0_14 == "--lockfile-only" then
      return mp.CLEAN
    end
    local l_0_17 = l_0_6 == "npm" and (l_0_14 == "-w" or l_0_14 == "--workspace")
    local l_0_19 = l_0_14 == "-p" and (l_0_6 == "npx" or l_0_6 == "bunx" or l_0_6 == "bun" and l_0_9[1] == "x" or l_0_6 == "yarn" and l_0_9[1] == "dlx")
    if l_0_8[l_0_14] or l_0_17 or l_0_19 then
      if l_0_15 == nil then
        l_0_12 = l_0_12 + 1
        l_0_15 = l_0_2[l_0_12]
      end
      if l_0_15 == nil or l_0_15 == "" then
        return mp.CLEAN
      end
      if l_0_14 == "--package" or l_0_19 then
        l_0_10 = true
      end
    end
  else
    l_0_9[#l_0_9 + 1] = l_0_13
    if l_0_6 == "npx" or l_0_6 == "bunx" or #l_0_9 == 2 and (l_0_6 == "bun" and l_0_9[1] == "x" or (l_0_6 == "pnpm" or l_0_6 == "yarn") and l_0_9[1] == "dlx") then
      break
    end
  end
  l_0_12 = l_0_12 + 1
end
local l_0_20 = l_0_9[1]
local l_0_22 = l_0_9[2] ~= nil and l_0_9[2] ~= ""
local l_0_23 = false
if l_0_6 == "npx" or l_0_6 == "bunx" then
  l_0_23 = l_0_20 ~= nil or l_0_10
elseif l_0_6 == "npm" then
  local l_0_24 = {
    install = true,
    add = true,
    i = true,
    ["in"] = true,
    ins = true,
    inst = true,
    insta = true,
    instal = true,
    isnt = true,
    isnta = true,
    isntal = true,
    isntall = true,
    ci = true,
    update = true,
    up = true,
    upgrade = true
  }
  l_0_23 = l_0_24[l_0_20] or l_0_20 == "audit" and l_0_9[2] == "fix" or (l_0_20 == "exec" or l_0_20 == "x") and (l_0_22 or l_0_10) or (l_0_20 == "init" or l_0_20 == "create" or l_0_20 == "pack") and l_0_22 or l_0_20 == "cache" and l_0_9[2] == "add" and l_0_9[3] ~= nil
elseif l_0_6 == "pnpm" then
  l_0_23 = l_0_20 == "install" or l_0_20 == "i" or l_0_20 == "update" or l_0_20 == "up" or l_0_20 == "upgrade" or l_0_20 == "fetch" or (l_0_20 == "add" or l_0_20 == "dlx" or l_0_20 == "create") and l_0_22
elseif l_0_6 == "yarn" then
  l_0_23 = l_0_20 == nil or l_0_20 == "install" or l_0_20 == "up" or l_0_20 == "upgrade" or (l_0_20 == "add" or l_0_20 == "dlx" or l_0_20 == "create") and l_0_22
elseif l_0_6 == "bun" then
  l_0_23 = l_0_20 == "install" or l_0_20 == "i" or l_0_20 == "update" or (l_0_20 == "add" or l_0_20 == "x" or l_0_20 == "create") and l_0_22
end
if not l_0_23 then
  return mp.CLEAN
end
local l_0_25 = mp.GetParentProcInfo()
local l_0_26 = {
  [l_0_0] = true
}
local l_0_27 = false
for l_0_28 = 1, 5 do
  if type(l_0_25) ~= "table" or type(l_0_25.ppid) ~= "string" or l_0_25.ppid == "" or l_0_26[l_0_25.ppid] then
    return mp.CLEAN
  end
  l_0_26[l_0_25.ppid] = true
  if MpCommon.DoesProcessHaveAttribute(l_0_25.ppid, "AIDiscovery:Agent") then
    l_0_27 = true
    break
  end
  if l_0_28 < 5 then
    l_0_25 = mp.GetParentProcInfo(l_0_25.ppid)
  end
end
if not l_0_27 then
  return mp.CLEAN
end
return mp.INFECTED
