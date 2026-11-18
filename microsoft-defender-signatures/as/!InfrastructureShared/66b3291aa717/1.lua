-- Threat: !InfrastructureShared
-- Name: 66b3291aa717
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = {
    "\\cmd.exe",
    "\\cscript.exe",
    "\\mshta.exe",
    "\\powershell.exe",
    "\\pwsh.exe",
    "\\regsvr32.exe",
    "\\rundll32.exe",
    "\\wscript.exe"
  }
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if l_0_1:sub(-#l_0_4) == l_0_4 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
