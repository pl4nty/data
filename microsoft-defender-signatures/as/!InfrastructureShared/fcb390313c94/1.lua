-- Threat: !InfrastructureShared
-- Name: fcb390313c94
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
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[2].utf8p2
end
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = l_0_3:lower()
local l_0_4 = l_0_3:match("%f[%w]node%f[%W]%s+\"([^\"]+%.js)\"")
l_0_4 = l_0_4 or l_0_3:match("%f[%w]node%f[%W]%s+'([^']+%.js)'")
l_0_4 = l_0_4 or l_0_3:match("%f[%w]node%f[%W]%s+([^%s]+%.js)")
if l_0_4 then
  bm.add_related_file(l_0_4)
end
return mp.INFECTED
