-- Threat: !InfrastructureShared
-- Name: 81b38352f554
-- Type: 21
-- Includes: BMLuaLib

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
local l_0_2 = getFirstChildPpid(l_0_0, "\\cmd.exe")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = getFirstChildPpid(l_0_2, "\\bitsadmin.exe")
if l_0_3 == nil then
  return mp.CLEAN
end
if this_sigattrlog[5].matched == false then
  return mp.CLEAN
end
local l_0_4 = this_sigattrlog[5].ppid
if l_0_3 ~= l_0_4 then
  return mp.CLEAN
end
local l_0_5 = {
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
bm_AddRelatedFileFromCommandLine(l_0_1, l_0_5)
return mp.INFECTED
