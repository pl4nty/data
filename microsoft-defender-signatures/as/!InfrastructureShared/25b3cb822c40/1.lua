-- Threat: !InfrastructureShared
-- Name: 25b3cb822c40
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  local l_0_1 = {
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
  local l_0_2 = string.match(l_0_0, "\\([^\\]+)$")
  if l_0_1[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
