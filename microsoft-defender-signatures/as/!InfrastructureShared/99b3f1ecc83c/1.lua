-- Threat: !InfrastructureShared
-- Name: 99b3f1ecc83c
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 ~= nil and (string.lower(l_0_0) == "d9e92961-6699-4647-99d4-e23663461fe5" or string.lower(l_0_0) == "2559b15e-e168-4d57-978b-6628179d78ac" or string.lower(l_0_0) == "8efa8f39-7f99-4428-bf6d-f2137e4a80d4" or string.lower(l_0_0) == "4c28b353-0987-4ece-981e-c985efa0d995" or string.lower(l_0_0) == "8b637727-7ed2-40ea-ad45-c54260cddf2e" or string.lower(l_0_0) == "cf258717-a6c4-47c1-96a1-2ce4edc921de" or string.lower(l_0_0) == "d289bdf9-eff5-4eb1-a0f0-faf97b61aad3") then
  return mp.CLEAN
end

function getFirstChildPpid(l_1_0, l_1_1)
  if l_1_0 == nil then
    return nil
  end
  local l_1_2 = true
  local l_1_3 = 0
  if l_1_1 ~= nil or 0 < string.len(l_1_1) then
    l_1_2 = false
    l_1_3 = string.len(l_1_1)
  end
  local l_1_4, l_1_5 = bm.get_process_relationships(l_1_0)
  if l_1_5 == nil or #l_1_5 < 1 or 4 < #l_1_5 then
    return nil
  end
  local l_1_6
  for l_1_7, l_1_8 in ipairs(l_1_5) do
    local l_1_9 = mp.bitand(l_1_8.reason_ex, 1)
    if l_1_9 == 1 and (l_1_2 == true or l_1_3 < string.len(l_1_8.image_path) and string.sub(l_1_8.image_path, -l_1_3) == l_1_1) then
      l_1_6 = l_1_8.ppid
      break
    end
  end
  return l_1_6
end

local l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].ppid
  l_0_2 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].ppid
  l_0_2 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].ppid
  l_0_2 = this_sigattrlog[3].utf8p2
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_3 = getFirstChildPpid(l_0_1, "\\powershell.exe")
if l_0_3 == nil then
  return mp.CLEAN
end
if this_sigattrlog[6].matched == false then
  return mp.CLEAN
end
local l_0_4 = this_sigattrlog[6].ppid
if l_0_3 ~= l_0_4 then
  return mp.CLEAN
end
local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_2)
local l_0_6 = {
  [".xls"] = true,
  [".doc"] = true,
  [".ppt"] = true,
  [".pps"] = true,
  docx = true,
  pptx = true,
  ppsx = true,
  xlsx = true,
  [".rtf"] = true,
  [".xml"] = true,
  dotx = true,
  dotm = true,
  [".odt"] = true,
  xlsb = true,
  xltx = true,
  xltm = true,
  xlam = true,
  [".xla"] = true,
  docm = true,
  xlsm = true,
  pptm = true
}
for l_0_7, l_0_8 in ipairs(l_0_5) do
  if string.len(l_0_8) > 4 and sysio.IsFileExists(l_0_8) then
    local l_0_9 = string.sub(l_0_8, -4)
    if l_0_6[l_0_9] and mp.IsKnownFriendlyFile(l_0_8, true, false) == false then
      bm.add_threat_file(l_0_8)
    end
  end
end
bm.add_threat_process(l_0_3)
local l_0_10 = this_sigattrlog[6].utf8p1
if l_0_10 == nil or string.find(string.lower(l_0_10), "\\appdata\\local\\\\seleniumbasic\\", 1, true) ~= nil then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_10) then
  local l_0_11 = mp.IsKnownFriendlyFile(l_0_10, true, true)
  if l_0_11 == false then
    bm.add_threat_file(l_0_10)
    return mp.INFECTED
  elseif l_0_11 == true then
    return mp.CLEAN
  end
end
return mp.CLEAN
