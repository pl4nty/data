-- Threat: !InfrastructureShared
-- Name: 52b30d65d128
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
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[1].utf8p2 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[1].utf8p2)
else
  return mp.CLEAN
end
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
if string.find(l_0_3, "ioreg -k ioplatformserialnumber | grep ioplatformserialnumber | cut -w -f5 | xargs", 1, true) and string.find(l_0_3, "whoami", 1, true) and string.find(l_0_3, "serialnumber", 1, true) and string.find(l_0_3, "modulename", 1, true) and string.find(l_0_3, "curl -fksl ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
