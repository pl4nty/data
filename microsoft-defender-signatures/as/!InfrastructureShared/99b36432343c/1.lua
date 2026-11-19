-- Threat: !InfrastructureShared
-- Name: 99b36432343c
-- Type: 21
-- Includes: BMLuaLib

function checkProcessTree(l_1_0, l_1_1)
  if l_1_0 == nil or l_1_1 == nil or type(l_1_1) ~= "table" then
    return nil
  end
  local l_1_2 = l_1_0
  local l_1_3 = {}
  for l_1_4, l_1_5 in ipairs(l_1_1) do
    local l_1_6 = 0
    local l_1_7, l_1_8 = bm.get_process_relationships(l_1_2)
    for l_1_9, l_1_10 in ipairs(l_1_8) do
      if mp.bitand(l_1_10.reason_ex, 1) == 1 and string.sub(l_1_10.image_path, -string.len(l_1_5)) == l_1_5 then
        l_1_2 = l_1_10.ppid
        l_1_6 = l_1_6 + 1
      end
      if 1 < l_1_6 then
        return nil
      end
    end
    if l_1_6 == 0 then
      return nil
    end
    table.insert(l_1_3, l_1_2)
  end
  return l_1_3
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
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = {
  "cmd.exe",
  "powershell.exe"
}
local l_0_3 = checkProcessTree(l_0_0, l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  local l_0_4 = {
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
  bm_AddRelatedFileFromCommandLine(l_0_1, l_0_4)
end
return mp.INFECTED
