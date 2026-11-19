-- Threat: !InfrastructureShared
-- Name: 130b3c67d1779
-- Type: 21
-- Includes: TechniqueTracker

function IsArrayMember(l_1_0, l_1_1)
  if l_1_1 == nil then
    return false
  end
  if #l_1_0 <= 0 then
    return false
  end
  for l_1_2 = 1, #l_1_0 do
    if l_1_0[l_1_2] == l_1_1 then
      return true
    end
  end
  return false
end

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[5].utf8p2))
else
  return mp.CLEAN
end
local l_0_1 = {
  "winword.exe",
  "mspub.exe",
  "excel.exe",
  "powerpnt.exe",
  "powershell.exe",
  "cscript.exe",
  "wscript.exe",
  "iexplore.exe",
  "microsoftedge.exe",
  "microsoftedgecp.exe",
  "chrome.exe",
  "firefox.exe",
  "python.exe",
  "rundll32.exe",
  "regsvr32.exe",
  "psexesvc.exe",
  "psexec.exe",
  "services.exe",
  "wininit.exe",
  "wmic.exe"
}
if IsProcNameInParentProcessTree("BM", l_0_1) then
  return mp.INFECTED
end
local l_0_2 = {}
local l_0_3 = 0
local l_0_4 = 0
for l_0_5 in string.gmatch(l_0_0, "[^&]+") do
  l_0_3 = l_0_3 + 1
  table.insert(l_0_2, {})
  l_0_4 = 0
  for l_0_6 in string.gmatch(l_0_5, "%S+") do
    l_0_4 = l_0_4 + 1
    l_0_2[l_0_3][l_0_4] = string.lower(l_0_6)
  end
end
local l_0_7 = {}
local l_0_8 = 0
for l_0_9 = 1, #l_0_2 do
  local l_0_10 = 0
  for l_0_11 = 1, #l_0_2[l_0_9] do
    if l_0_8 == 0 then
      if l_0_10 == 0 and (string.sub(l_0_2[l_0_9][l_0_11], -9) == "bitsadmin" or string.sub(l_0_2[l_0_9][l_0_11], -13) == "bitsadmin.exe") then
        l_0_10 = 1000
      elseif l_0_10 == 1000 and l_0_2[l_0_9][l_0_11] == "/transfer" or l_0_10 == 1000 and l_0_2[l_0_9][l_0_11] == "/addfile" then
        l_0_10 = 2000
      elseif l_0_10 == 2000 and l_0_2[l_0_9][l_0_11] == "/upload" then
        l_0_10 = -1
        l_0_8 = -1
      elseif l_0_10 == 2000 and string.sub(l_0_2[l_0_9][l_0_11], 1, 4) == "http" then
        l_0_10 = 3000
      elseif l_0_10 == 3000 and string.match(l_0_2[l_0_9][l_0_11], "\\\\[^ ]\\C$[^ ]* [^ ]+") ~= nil then
        l_0_10 = 4000
        l_0_8 = 1
        l_0_7[#l_0_7 + 1] = l_0_2[l_0_9][l_0_11]
      end
    end
    if l_0_8 == 1 then
      if l_0_10 == 0 and l_0_11 == 1 and l_0_2[l_0_9][l_0_11] == "start" then
        l_0_10 = 1000
      elseif l_0_10 == 1000 and string.match(l_0_2[l_0_9][l_0_11], "\\\\[^ ]\\C$[^ ]* [^ ]+") ~= nil and IsArrayMember(l_0_7, l_0_2[l_0_9][l_0_11]) == true and string.sub(l_0_2[l_0_9][l_0_11], -4) == ".exe" or l_0_10 == 0 and l_0_11 == 1 and string.match(l_0_2[l_0_9][l_0_11], "\\\\[^ ]\\C$[^ ]* [^ ]+") ~= nil and IsArrayMember(l_0_7, l_0_2[l_0_9][l_0_11]) == true and string.sub(l_0_2[l_0_9][l_0_11], -4) == ".exe" then
        l_0_10 = 9999
        l_0_8 = 9999
      elseif l_0_10 == 0 and 1 < l_0_11 and string.match(l_0_2[l_0_9][l_0_11], "\\\\[^ ]\\C$[^ ]* [^ ]+") ~= nil and IsArrayMember(l_0_7, l_0_2[l_0_9][l_0_11]) == true then
        l_0_10 = 2000
      elseif l_0_10 == 2000 and 1 < l_0_11 and string.match(l_0_2[l_0_9][l_0_11], "\\\\[^ ]\\C$[^ ]* [^ ]+") ~= nil and IsArrayMember(l_0_7, l_0_2[l_0_9][l_0_11]) == false then
        l_0_10 = 3000
        l_0_7[#l_0_7 + 1] = l_0_2[l_0_9][l_0_11]
      end
    end
    if l_0_8 == 9999 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
