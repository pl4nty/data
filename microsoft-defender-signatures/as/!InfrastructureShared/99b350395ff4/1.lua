-- Threat: !InfrastructureShared
-- Name: 99b350395ff4
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
local l_0_2
local l_0_3 = "\\cmd.exe"
local l_0_4 = string.len(l_0_3)
local l_0_5, l_0_6 = bm.get_process_relationships(l_0_0)
if l_0_6 == nil or #l_0_6 < 1 or 3 < #l_0_6 then
  return mp.CLEAN
end
for l_0_7, l_0_8 in ipairs(l_0_6) do
  local l_0_9 = mp.bitand(l_0_8.reason_ex, 1)
  if l_0_9 == 1 and l_0_4 < string.len(l_0_8.image_path) and string.sub(l_0_8.image_path, -l_0_4) == l_0_3 then
    l_0_2 = l_0_8.ppid
    break
  end
end
if l_0_2 == nil then
  return mp.CLEAN
end
if not this_sigattrlog[6].matched then
  return mp.CLEAN
end
local l_0_10 = this_sigattrlog[6].ppid
local l_0_11 = 0
local l_0_12 = false
local l_0_13, l_0_14 = bm.get_process_relationships(l_0_2)
for l_0_15, l_0_16 in ipairs(l_0_14) do
  local l_0_17 = mp.bitand(l_0_16.reason_ex, 1)
  if l_0_17 == 1 and l_0_4 < string.len(l_0_16.image_path) and string.sub(l_0_16.image_path, -l_0_4) == l_0_3 then
    if l_0_10 == l_0_16.ppid then
      l_0_12 = true
    end
    l_0_11 = l_0_11 + 1
  end
end
if l_0_11 ~= 2 or l_0_12 == false then
  return mp.CLEAN
end
local l_0_18 = mp.GetExecutablesFromCommandLine(l_0_1)
for l_0_19, l_0_20 in ipairs(l_0_18) do
  if l_0_20 ~= nil and string.len(l_0_20) >= 4 and string.lower(string.sub(l_0_20, -4)) ~= ".exe" and sysio.IsFileExists(l_0_20) then
    bm.add_related_file(l_0_20)
  end
end
return mp.INFECTED
