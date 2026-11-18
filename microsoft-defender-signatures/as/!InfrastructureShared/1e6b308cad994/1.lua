-- Threat: !InfrastructureShared
-- Name: 1e6b308cad994
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil and this_sigattrlog[6].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[6].utf8p2
end
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end

local function l_0_4(l_1_0)
  if not l_1_0 then
    return nil, nil
  end
  local l_1_1, l_1_2 = l_1_0:match("^%s*cp%s+\"([^\"]+)\"%s+\"([^\"]+)\"%s*$")
  if l_1_1 then
    return l_1_1, l_1_2
  end
  l_1_1, l_1_2 = l_1_0:match("^%s*cp%s+'([^']+)'%s+'([^']+)'%s*$")
  if l_1_1 then
    return l_1_1, l_1_2
  end
  local l_1_3 = "^%s*cp%s+(([^%s]*(\\%s[^%s]*)*))%s+(([^%s]*(\\%s[^%s]*)*))%s*$"
  l_1_1, _, __, l_1_2 = l_1_0:match(l_1_3)
  if l_1_1 then
    l_1_1 = l_1_1:gsub("\\ ", " ")
    l_1_2 = l_1_2:gsub("\\ ", " ")
    return l_1_1, l_1_2
  end
  l_1_1, l_1_2 = l_1_0:match("^%s*cp%s+(.-)%s+(/.+)%s*$")
  if l_1_1 then
    return l_1_1, l_1_2
  end
  return nil, nil
end

local l_0_5
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil and this_sigattrlog[7].utf8p2 ~= "" then
  l_0_5 = this_sigattrlog[7].utf8p2
end
if l_0_5 == "" or l_0_5 == nil or string.find(l_0_5, "/.local/bin/officecli.new", 1, true) then
  return mp.CLEAN
end
local l_0_6, l_0_7 = l_0_4(l_0_5)
if l_0_6 == "" or l_0_6 == nil or l_0_7 == "" or l_0_7 == nil then
  return mp.CLEAN
end
local l_0_8
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil and this_sigattrlog[8].utf8p2 ~= "" then
  l_0_8 = this_sigattrlog[8].utf8p2
end
if l_0_8 == "" or l_0_8 == nil then
  return mp.CLEAN
end
if l_0_3 == l_0_6 and string.find(l_0_8, l_0_7, 1, true) and (string.find(l_0_8, "com.apple.", 1, true) or string.find(l_0_8, "com.zoom.", 1, true) or string.find(l_0_8, "com.python.", 1, true)) then
  if sysio.IsFileExists(l_0_7) then
    bm.add_threat_file(l_0_7)
  end
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  return mp.INFECTED
end
return mp.CLEAN
