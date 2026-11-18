-- Threat: !InfrastructureShared
-- Name: 65d7329f0e44
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = string.sub(l_0_1, -15):match("\\([^\\]+)$")
local l_0_3 = {
  ["powershell.exe"] = true,
  ["pwsh.exe"] = true,
  ["cmd.exe"] = true,
  ["wscript.exe"] = true,
  ["cscript.exe"] = true,
  ["mshta.exe"] = true,
  ["rundll32.exe"] = true,
  ["regsvr32.exe"] = true,
  ["certutil.exe"] = true,
  ["bitsadmin.exe"] = true,
  ["python.exe"] = true,
  ["pythonw.exe"] = true
}
if l_0_3[l_0_2] then
  return mp.INFECTED
end
return mp.CLEAN
