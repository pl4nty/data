-- Threat: !InfrastructureShared
-- Name: 43b3fce5817d
-- Type: 21

local l_0_0 = bm.get_imagepath()
if not l_0_0 or l_0_0:lower() ~= "/system/applications/utilities/terminal.app/contents/macos/terminal" then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[1]
if not l_0_1.matched or not l_0_1.utf8p2 then
  return mp.CLEAN
end
local l_0_2 = "^copydata%('apple cfpasteboard general' %(.+%) gen: %-?%d+ item: %-?%d+ flavor: 'public%.utf8%-plain%-text'%)$"
if not l_0_1.utf8p2:lower():match(l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED
