-- Threat: !InfrastructureShared
-- Name: !#MpWindowsPackageInstall
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpOnCloseNewlyCreatedHintRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = {
  ["node.exe"] = "node",
  ["npm.exe"] = "node",
  ["npx.exe"] = "node",
  ["pnpm.exe"] = "node",
  ["yarn.exe"] = "node",
  ["bun.exe"] = "node",
  ["corepack.exe"] = "node",
  ["python.exe"] = "python",
  ["pythonw.exe"] = "python",
  ["pip.exe"] = "python",
  ["pip3.exe"] = "python",
  ["uv.exe"] = "python",
  ["poetry.exe"] = "python",
  ["pipx.exe"] = "python",
  ["nuget.exe"] = "nuget",
  ["dotnet.exe"] = "nuget",
  ["msbuild.exe"] = "nuget",
  ["devenv.exe"] = "nuget",
  ["java.exe"] = "java",
  ["javaw.exe"] = "java",
  ["gradle.exe"] = "gradle",
  ["ruby.exe"] = "ruby",
  ["rubyw.exe"] = "ruby",
  ["cargo.exe"] = "cargo",
  ["go.exe"] = "go",
  ["php.exe"] = "composer",
  ["composer.exe"] = "composer",
  ["choco.exe"] = "chocolatey",
  ["deno.exe"] = "deno",
  ["powershell.exe"] = "powershell",
  ["pwsh.exe"] = "powershell",
  ["code.exe"] = "vscode",
  ["code-insiders.exe"] = "vscode"
}
local l_0_2 = l_0_1[l_0_0]
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = {
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
local l_0_5 = {
  "/npm-cli.js",
  "/npx-cli.js",
  "/pnpm.cjs",
  "/pnpm.js",
  "/yarn.js",
  "/yarn.cjs",
  "/corepack.cjs"
}

local function l_0_6(l_1_0)
  if l_1_0 == nil or l_1_0 == "" then
    return false
  end
  l_1_0 = string.lower(l_1_0):gsub("[\"']", " ")
  for l_1_1 in l_1_0:gmatch("%S+") do
    if l_0_4[l_1_1] then
      return true
    end
  end
  return false
end

local function l_0_7(l_2_0, l_2_1)
  if l_2_0 == nil or l_2_1 == nil then
    return false
  end
  local l_2_2 = string.lower(l_2_1):gsub("\\", "/")
  if l_2_0 == "node.exe" then
    local l_2_3 = false
    for l_2_4, l_2_5 in ipairs(l_0_5) do
      if l_2_2:find(l_2_5, 1, true) ~= nil then
        l_2_3 = true
        if l_2_5 == "/npx-cli.js" then
          return true
        end
        break
      end
    end
    if not l_2_3 then
      return false
    end
  elseif l_0_1[l_2_0] ~= "node" then
    return false
  elseif l_2_0 == "npx.exe" then
    return true
  end
  return l_0_6(l_2_2)
end

local function l_0_8(l_3_0, l_3_1)
  local l_3_2 = l_3_0
  local l_3_3 = l_3_1
  for l_3_4 = 0, 5 do
    if l_3_3 == nil then
      break
    end
    local l_3_5 = mp.GetProcessCommandLine(l_3_3)
    if l_0_7(l_3_2, l_3_5) then
      return true
    end
    if l_3_4 == 5 then
      break
    end
    local l_3_6 = mp.GetParentProcInfo(l_3_3)
    if l_3_6 == nil or l_3_6.ppid == nil then
      break
    end
    l_3_2 = nil
    if l_3_6.image_path ~= nil then
      l_3_2 = string.lower(l_3_6.image_path):match("([^\\/]+)$")
    end
    l_3_3 = l_3_6.ppid
  end
  return false
end

if l_0_2 == "node" and l_0_3 == "package.json" then
  local l_0_9 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  local l_0_11 = l_0_9 ~= nil and (l_0_9:find("\\node_modules\\", 1, true) ~= nil or l_0_9:find("\\_npx\\", 1, true) ~= nil)
  if not l_0_11 then
    return mp.CLEAN
  end
  local l_0_12 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if not l_0_8(l_0_0, l_0_12) then
    return mp.CLEAN
  end
  if not IsKeyInRollingQueue("NodePackageInstallSeen", l_0_9, true) then
    AppendToRollingQueue("NodePackageInstallSeen", l_0_9, "1", 28800, 50000, 1)
  end
  mp.set_mpattribute("MpNodePackageInstall")
  return mp.INFECTED
end
if l_0_2 == "python" and (l_0_3 == "metadata" or l_0_3 == "record") then
  local l_0_13 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_13 ~= nil and l_0_13:find(".dist-info", 1, true) ~= nil then
    mp.set_mpattribute("MpPythonPackageInstall")
    return mp.INFECTED
  end
end
if l_0_2 == "nuget" and l_0_3 == ".nupkg.metadata" then
  mp.set_mpattribute("MpNuGetPackageInstall")
  return mp.INFECTED
end
if l_0_2 == "java" and l_0_3:sub(-4) == ".pom" then
  local l_0_14 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_14 ~= nil and l_0_14:find("\\.m2\\repository\\", 1, true) ~= nil then
    mp.set_mpattribute("MpMavenPackageInstall")
    return mp.INFECTED
  end
end
if (l_0_2 == "java" or l_0_2 == "gradle") and l_0_3:sub(-4) == ".jar" then
  local l_0_15 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_15 ~= nil and l_0_15:find("\\.gradle\\caches\\modules-2\\", 1, true) ~= nil then
    mp.set_mpattribute("MpGradlePackageInstall")
    return mp.INFECTED
  end
end
if l_0_2 == "ruby" and l_0_3:sub(-8) == ".gemspec" then
  local l_0_16 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_16 ~= nil and l_0_16:find("\\specifications\\", 1, true) ~= nil then
    mp.set_mpattribute("MpRubyGemsPackageInstall")
    return mp.INFECTED
  end
end
if l_0_2 == "cargo" and l_0_3 == ".cargo-ok" then
  mp.set_mpattribute("MpCargoPackageInstall")
  return mp.INFECTED
end
if l_0_2 == "go" and l_0_3:sub(-8) == ".ziphash" then
  local l_0_17 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_17 ~= nil and l_0_17:find("\\pkg\\mod\\cache\\download\\", 1, true) ~= nil then
    mp.set_mpattribute("MpGoModulePackageInstall")
    return mp.INFECTED
  end
end
if l_0_2 == "composer" and l_0_3 == "installed.json" then
  local l_0_18 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_18 ~= nil and l_0_18:find("\\vendor\\composer\\", 1, true) ~= nil then
    mp.set_mpattribute("MpComposerPackageInstall")
    return mp.INFECTED
  end
end
if l_0_2 == "chocolatey" and l_0_3:sub(-7) == ".nuspec" then
  local l_0_19 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_19 ~= nil and l_0_19:find("\\chocolatey\\lib\\", 1, true) ~= nil then
    mp.set_mpattribute("MpChocolateyPackageInstall")
    return mp.INFECTED
  end
end
if l_0_2 == "deno" and l_0_3 == "deno.lock" then
  mp.set_mpattribute("MpDenoPackageInstall")
  return mp.INFECTED
end
if l_0_2 == "powershell" and l_0_3 == "psgetmoduleinfo.xml" then
  local l_0_20 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_20 ~= nil and l_0_20:find("\\modules\\", 1, true) ~= nil then
    mp.set_mpattribute("MpPowerShellGalleryPackageInstall")
    return mp.INFECTED
  end
end
if l_0_2 == "vscode" and l_0_3 == ".vsixmanifest" then
  local l_0_21 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_21 ~= nil and l_0_21:find("\\extensions\\", 1, true) ~= nil then
    mp.set_mpattribute("MpVSCodeExtensionInstall")
    return mp.INFECTED
  end
end
return mp.CLEAN
