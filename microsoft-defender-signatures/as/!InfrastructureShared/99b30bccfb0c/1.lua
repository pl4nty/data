-- Threat: !InfrastructureShared
-- Name: 99b30bccfb0c
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].ppid
  l_0_1 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].ppid
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].ppid
  l_0_1 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
if this_sigattrlog[4].matched == false then
  return mp.CLEAN
end
local l_0_2 = this_sigattrlog[4].ppid
if l_0_0 ~= l_0_2 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = bm.get_process_relationships(l_0_0)
local l_0_5
for l_0_6, l_0_7 in ipairs(l_0_4) do
  local l_0_8 = mp.bitand(l_0_7.reason_ex, 1)
  if l_0_8 == 1 and string.len(l_0_7.image_path) > 8 and string.sub(l_0_7.image_path, -8) == "\\cmd.exe" then
    l_0_5 = l_0_7.ppid
    break
  end
end
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_9, l_0_10 = bm.get_process_relationships(l_0_5)
if l_0_10 == nil or #l_0_10 < 2 then
  return mp.CLEAN
end
if this_sigattrlog[5].matched == false then
  return mp.CLEAN
end
local l_0_11 = this_sigattrlog[5].ppid
if this_sigattrlog[6].matched == false then
  return mp.CLEAN
end
local l_0_12 = this_sigattrlog[6].ppid
local l_0_13 = false
local l_0_14 = false
for l_0_15, l_0_16 in ipairs(l_0_10) do
  local l_0_17 = mp.bitand(l_0_16.reason_ex, 1)
  if l_0_17 == 1 and string.len(l_0_16.image_path) > 8 and string.sub(l_0_16.image_path, -8) == "\\cmd.exe" then
    if l_0_16.ppid == l_0_11 then
      l_0_13 = true
    elseif l_0_16.ppid == l_0_12 then
      l_0_14 = true
    end
  end
end
if l_0_13 == false or l_0_14 == false then
  return mp.CLEAN
end
local l_0_18 = mp.GetExecutablesFromCommandLine(l_0_1)
for l_0_19, l_0_20 in ipairs(l_0_18) do
  if l_0_20 ~= nil and 4 <= string.len(l_0_20) and string.lower(string.sub(l_0_20, -4)) ~= ".exe" and sysio.IsFileExists(l_0_20) then
    bm.add_related_file(l_0_20)
  end
end
return mp.INFECTED
