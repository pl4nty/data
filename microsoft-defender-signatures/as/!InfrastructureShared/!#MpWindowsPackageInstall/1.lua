-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#MpWindowsPackageInstall\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = {}
l_0_1["node.exe"] = "node"
l_0_1["npm.exe"] = "node"
l_0_1["npx.exe"] = "node"
l_0_1["pnpm.exe"] = "node"
l_0_1["yarn.exe"] = "node"
l_0_1["bun.exe"] = "node"
l_0_1["corepack.exe"] = "node"
l_0_1["python.exe"] = "python"
l_0_1["pythonw.exe"] = "python"
l_0_1["pip.exe"] = "python"
l_0_1["pip3.exe"] = "python"
l_0_1["uv.exe"] = "python"
l_0_1["poetry.exe"] = "python"
l_0_1["pipx.exe"] = "python"
l_0_1["nuget.exe"] = "nuget"
l_0_1["dotnet.exe"] = "nuget"
l_0_1["msbuild.exe"] = "nuget"
l_0_1["devenv.exe"] = "nuget"
l_0_1["java.exe"] = "java"
l_0_1["javaw.exe"] = "java"
l_0_1["gradle.exe"] = "gradle"
l_0_1["ruby.exe"] = "ruby"
l_0_1["rubyw.exe"] = "ruby"
l_0_1["cargo.exe"] = "cargo"
l_0_1["go.exe"] = "go"
l_0_1["php.exe"] = "composer"
l_0_1["composer.exe"] = "composer"
l_0_1["choco.exe"] = "chocolatey"
l_0_1["deno.exe"] = "deno"
l_0_1["powershell.exe"] = "powershell"
l_0_1["pwsh.exe"] = "powershell"
l_0_1["code.exe"] = "vscode"
l_0_1["code-insiders.exe"] = "vscode"
local l_0_2 = l_0_1[l_0_0]
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = {}
l_0_4.install = true
l_0_4.i = true
l_0_4.ci = true
l_0_4.add = true
l_0_4.update = true
l_0_4.up = true
l_0_4.upgrade = true
l_0_4.exec = true
l_0_4.dlx = true
l_0_4.x = true
local l_0_5 = {}
-- DECOMPILER ERROR at PC87: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC88: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC90: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC94: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC100: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC102: Overwrote pending register: R10 in 'AssignReg'

if l_0_2 == "node" and l_0_3 == "package.json" then
  local l_0_9 = "/npm-cli.js"
  -- DECOMPILER ERROR at PC107: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R12 in 'AssignReg'

  if not (("/pnpm.js").getfilename)(("/yarn.js").FILEPATH_QUERY_LOWERCASE) ~= nil and ((("/pnpm.js").getfilename)(("/yarn.js").FILEPATH_QUERY_LOWERCASE)):find("/corepack.cjs", 1, true) ~= nil or ((("/pnpm.js").getfilename)(("/yarn.js").FILEPATH_QUERY_LOWERCASE)):find("\\_npx\\", 1, true) ~= nil then
    return mp.CLEAN
  end
  local l_0_13 = "/npx-cli.js"
  if not ("/pnpm.cjs")(l_0_0, (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)) then
    return mp.CLEAN
  end
  if not IsKeyInRollingQueue("NodePackageInstallSeen", (("/pnpm.js").getfilename)(("/yarn.js").FILEPATH_QUERY_LOWERCASE), true) then
    AppendToRollingQueue("NodePackageInstallSeen", (("/pnpm.js").getfilename)(("/yarn.js").FILEPATH_QUERY_LOWERCASE), "1", 28800, 50000, 1)
  end
  ;
  (mp.set_mpattribute)("MpNodePackageInstall")
  return mp.INFECTED
end
do
  if l_0_2 == "python" and (l_0_3 == "metadata" or l_0_3 == "record") then
    local l_0_14 = nil
    if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find(".dist-info", 1, true) ~= nil then
      (mp.set_mpattribute)("MpPythonPackageInstall")
      return mp.INFECTED
    end
  end
  if l_0_2 == "nuget" and l_0_3 == ".nupkg.metadata" then
    (mp.set_mpattribute)("MpNuGetPackageInstall")
    return mp.INFECTED
  end
  do
    if l_0_2 == "java" and l_0_3:sub(-4) == ".pom" then
      local l_0_15 = nil
      if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find("\\.m2\\repository\\", 1, true) ~= nil then
        (mp.set_mpattribute)("MpMavenPackageInstall")
        return mp.INFECTED
      end
    end
    do
      if (l_0_2 == "java" or l_0_2 == "gradle") and l_0_3:sub(-4) == ".jar" then
        local l_0_16 = nil
        if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find("\\.gradle\\caches\\modules-2\\", 1, true) ~= nil then
          (mp.set_mpattribute)("MpGradlePackageInstall")
          return mp.INFECTED
        end
      end
      do
        if l_0_2 == "ruby" and l_0_3:sub(-8) == ".gemspec" then
          local l_0_17 = nil
          if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find("\\specifications\\", 1, true) ~= nil then
            (mp.set_mpattribute)("MpRubyGemsPackageInstall")
            return mp.INFECTED
          end
        end
        if l_0_2 == "cargo" and l_0_3 == ".cargo-ok" then
          (mp.set_mpattribute)("MpCargoPackageInstall")
          return mp.INFECTED
        end
        do
          if l_0_2 == "go" and l_0_3:sub(-8) == ".ziphash" then
            local l_0_18 = nil
            if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find("\\pkg\\mod\\cache\\download\\", 1, true) ~= nil then
              (mp.set_mpattribute)("MpGoModulePackageInstall")
              return mp.INFECTED
            end
          end
          do
            if l_0_2 == "composer" and l_0_3 == "installed.json" then
              local l_0_19 = nil
              if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find("\\vendor\\composer\\", 1, true) ~= nil then
                (mp.set_mpattribute)("MpComposerPackageInstall")
                return mp.INFECTED
              end
            end
            do
              if l_0_2 == "chocolatey" and l_0_3:sub(-7) == ".nuspec" then
                local l_0_20 = nil
                if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find("\\chocolatey\\lib\\", 1, true) ~= nil then
                  (mp.set_mpattribute)("MpChocolateyPackageInstall")
                  return mp.INFECTED
                end
              end
              if l_0_2 == "deno" and l_0_3 == "deno.lock" then
                (mp.set_mpattribute)("MpDenoPackageInstall")
                return mp.INFECTED
              end
              do
                if l_0_2 == "powershell" and l_0_3 == "psgetmoduleinfo.xml" then
                  local l_0_21 = nil
                  if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find("\\modules\\", 1, true) ~= nil then
                    (mp.set_mpattribute)("MpPowerShellGalleryPackageInstall")
                    return mp.INFECTED
                  end
                end
                do
                  do
                    if l_0_2 == "vscode" and l_0_3 == ".vsixmanifest" then
                      local l_0_22 = nil
                      if (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE) ~= nil and ((mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)):find("\\extensions\\", 1, true) ~= nil then
                        (mp.set_mpattribute)("MpVSCodeExtensionInstall")
                        return mp.INFECTED
                      end
                    end
                    do return mp.CLEAN end
                    -- DECOMPILER ERROR at PC444: freeLocal<0 in 'ReleaseLocals'

                    -- DECOMPILER ERROR: 19 unprocessed JMP targets
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

