-- Threat: !InfrastructureShared
-- Name: !#SLF:NodePackageInstallMac
-- Type: 13
-- MpAttributes: MpOnModifiedCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = 0
local l_0_2 = l_0_0:find("/", 1, true)
while l_0_2 ~= nil do
  l_0_1 = l_0_2
  l_0_2 = l_0_0:find("/", l_0_1 + 1, true)
end
if 0 < l_0_1 then
  l_0_0 = l_0_0:sub(l_0_1 + 1)
end
local l_0_3 = {
  node = true,
  npm = true,
  npx = true,
  pnpm = true,
  yarn = true,
  bun = true,
  corepack = true
}
if not l_0_3[l_0_0] then
  return mp.CLEAN
end
local l_0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_4 ~= "package.json" then
  return mp.CLEAN
end
local l_0_5 = mp.getfilename(0)
if l_0_5 == nil or l_0_5:find("/node_modules/", 1, true) == nil and l_0_5:find("/_npx/", 1, true) == nil then
  return mp.CLEAN
end
local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_6 == nil then
  return mp.CLEAN
end
local l_0_7 = {
  install = true,
  i = true,
  ci = true,
  add = true,
  update = true,
  up = true,
  upgrade = true,
  exec = true,
  dlx = true,
  x = true
}
local l_0_8 = {
  ["npm-cli.js"] = true,
  ["npx-cli.js"] = true,
  ["pnpm.cjs"] = true,
  ["pnpm.js"] = true,
  ["yarn.js"] = true,
  ["yarn.cjs"] = true,
  ["corepack.cjs"] = true,
  npm = true,
  npx = true,
  pnpm = true,
  yarn = true,
  corepack = true
}

local function l_0_9(l_1_0)
  for l_1_1 in l_1_0:gmatch("%S+") do
    if l_0_7[l_1_1] then
      return true
    end
  end
  return false
end

local function l_0_10(l_2_0, l_2_1)
  if l_2_0 == nil or l_2_1 == nil then
    return false
  end
  local l_2_2 = string.lower(l_2_1):gsub("[\"']", " ")
  if l_2_0 == "node" then
    local l_2_3
    for l_2_4 in l_2_2:gmatch("%S+") do
      local l_2_5 = l_2_4:match("/([^/]+)$")
      if l_0_8[l_2_5] then
        l_2_3 = l_2_5
        break
      end
    end
    if l_2_3 == nil then
      return false
    end
    if l_2_3 == "npx" or l_2_3 == "npx-cli.js" then
      return true
    end
  elseif not l_0_3[l_2_0] then
    return false
  elseif l_2_0 == "npx" then
    return true
  end
  return l_0_9(l_2_2)
end

local function l_0_11(l_3_0, l_3_1)
  local l_3_2 = l_3_0
  for l_3_3 = 0, 5 do
    local l_3_4 = mp.GetProcessCommandLine(l_3_1)
    if l_0_10(l_3_2, l_3_4) then
      return true
    end
    if l_3_3 == 5 then
      break
    end
    local l_3_5 = mp.GetParentProcInfo(l_3_1)
    if l_3_5 == nil or l_3_5.ppid == nil then
      break
    end
    l_3_2 = nil
    if l_3_5.image_path ~= nil then
      l_3_2 = string.lower(l_3_5.image_path):match("([^/]+)$")
    end
    l_3_1 = l_3_5.ppid
  end
  return false
end

if not l_0_11(l_0_0, l_0_6) then
  return mp.CLEAN
end
return mp.INFECTED
