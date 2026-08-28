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
l_0_1["pnpm.exe"] = "node"
l_0_1["yarn.exe"] = "node"
l_0_1["bun.exe"] = "node"
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
do
  if l_0_2 == "node" and l_0_3 == "package.json" then
    local l_0_4 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
    if l_0_4 ~= nil and not IsKeyInRollingQueue("NodePackageInstallSeen", l_0_4, true) then
      AppendToRollingQueue("NodePackageInstallSeen", l_0_4, "1", 28800, 50000, 1)
    end
    ;
    (mp.set_mpattribute)("MpNodePackageInstall")
    return mp.INFECTED
  end
  do
    if l_0_2 == "python" and (l_0_3 == "metadata" or l_0_3 == "record") then
      local l_0_5 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
      if l_0_5 ~= nil and l_0_5:find(".dist-info", 1, true) ~= nil then
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
        local l_0_6 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
        if l_0_6 ~= nil and l_0_6:find("\\.m2\\repository\\", 1, true) ~= nil then
          (mp.set_mpattribute)("MpMavenPackageInstall")
          return mp.INFECTED
        end
      end
      do
        if (l_0_2 == "java" or l_0_2 == "gradle") and l_0_3:sub(-4) == ".jar" then
          local l_0_7 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
          if l_0_7 ~= nil and l_0_7:find("\\.gradle\\caches\\modules-2\\", 1, true) ~= nil then
            (mp.set_mpattribute)("MpGradlePackageInstall")
            return mp.INFECTED
          end
        end
        do
          if l_0_2 == "ruby" and l_0_3:sub(-8) == ".gemspec" then
            local l_0_8 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
            if l_0_8 ~= nil and l_0_8:find("\\specifications\\", 1, true) ~= nil then
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
              local l_0_9 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
              if l_0_9 ~= nil and l_0_9:find("\\pkg\\mod\\cache\\download\\", 1, true) ~= nil then
                (mp.set_mpattribute)("MpGoModulePackageInstall")
                return mp.INFECTED
              end
            end
            do
              if l_0_2 == "composer" and l_0_3 == "installed.json" then
                local l_0_10 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
                if l_0_10 ~= nil and l_0_10:find("\\vendor\\composer\\", 1, true) ~= nil then
                  (mp.set_mpattribute)("MpComposerPackageInstall")
                  return mp.INFECTED
                end
              end
              do
                if l_0_2 == "chocolatey" and l_0_3:sub(-7) == ".nuspec" then
                  local l_0_11 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
                  if l_0_11 ~= nil and l_0_11:find("\\chocolatey\\lib\\", 1, true) ~= nil then
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
                    local l_0_12 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
                    if l_0_12 ~= nil and l_0_12:find("\\modules\\", 1, true) ~= nil then
                      (mp.set_mpattribute)("MpPowerShellGalleryPackageInstall")
                      return mp.INFECTED
                    end
                  end
                  do
                    if l_0_2 == "vscode" and l_0_3 == ".vsixmanifest" then
                      local l_0_13 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
                      if l_0_13 ~= nil and l_0_13:find("\\extensions\\", 1, true) ~= nil then
                        (mp.set_mpattribute)("MpVSCodeExtensionInstall")
                        return mp.INFECTED
                      end
                    end
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

