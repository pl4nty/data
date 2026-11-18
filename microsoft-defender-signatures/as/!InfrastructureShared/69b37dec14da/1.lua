-- Threat: !InfrastructureShared
-- Name: 69b37dec14da
-- Type: 21
-- Includes: TechniqueTracker

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_1 = string.lower(this_sigattrlog[1].utf8p2)
  l_0_0 = string.gsub(l_0_0, "\\\\", "\\")
  l_0_1 = string.gsub(l_0_1, "\\\\", "\\")
  if l_0_0 == l_0_1 then
    local l_0_2 = string.lower(bm.get_imagepath())
    if l_0_2 then
      local l_0_3 = {
        ["powershell.exe"] = true,
        ["wscript.exe"] = true,
        ["cscript.exe"] = true,
        ["mshta.exe"] = true,
        ["cmd.exe"] = true,
        ["rundll32.exe"] = true,
        ["regsvr32.exe"] = true,
        ["msbuild.exe"] = true,
        ["vbcscompiler.exe"] = true,
        ["csc.exe"] = true,
        ["python.exe"] = true,
        ["pythonw.exe"] = true,
        ["winword.exe"] = true,
        ["excel.exe"] = true,
        ["powerpnt.exe"] = true
      }
      local l_0_4 = string.match(l_0_2, "\\([^\\]+)$")
      if l_0_3[l_0_4] then
        TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
        return mp.INFECTED
      end
      if string.find(l_0_2, "\\windows\\", 1, true) or string.find(l_0_2, "\\program files", 1, true) or string.find(l_0_2, "\\scanner\\", 1, true) or string.find(l_0_2, "\\chrome", 1, true) or string.find(l_0_2, "\\programfiles\\", 1, true) then
        return mp.CLEAN
      end
      TrackCustomPersistContextNameByPPID("set", "bm", "MimikatzTrigger")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
