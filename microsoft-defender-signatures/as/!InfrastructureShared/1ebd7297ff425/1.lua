-- Threat: !InfrastructureShared
-- Name: 1ebd7297ff425
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if (l_0_1 == nil or string.find(l_0_1, "explorer.exe", 1, true)) == nil then
    return mp.CLEAN
  end
end
local l_0_3 = mp.GetScannedPPID()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = mp.GetProcessCommandLine(l_0_3)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_4:lower():gsub("%^", ""):gsub("[\"']", "")
local l_0_6 = {
  "curl",
  "wget",
  "start",
  "mshta",
  "powershell",
  "pwsh",
  "wscript",
  "cscript",
  "rundll32",
  "regsvr32",
  "certutil",
  "bitsadmin",
  "invoke-webrequest",
  "invoke-restmethod",
  "irm",
  "iwr",
  "downloadstring",
  "downloadfile",
  "findstr"
}
for l_0_7, l_0_8 in ipairs(l_0_6) do
  if l_0_5:find(l_0_8, 1, true) and not l_0_4:find(l_0_8, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
