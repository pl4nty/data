-- Threat: !InfrastructureShared
-- Name: 181b3c1b0bbf9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = string.sub(l_0_0, -4)
  local l_0_2 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_2, l_0_1, 1, true) == nil then
    return mp.CLEAN
  end
end
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 == nil or l_0_3.ppid == nil then
  return mp.CLEAN
end
local l_0_4 = {
  {
    "w3wp.exe",
    "-ap \"msexchange"
  }
}
if not checkParentCmdline(l_0_3.ppid, l_0_4, 5) then
  return mp.CLEAN
end
bm.add_related_file(l_0_0)
return mp.INFECTED
