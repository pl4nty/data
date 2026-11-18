-- Threat: !InfrastructureShared
-- Name: 337b31f8ea7c9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(bm.get_imagepath() or "")
local l_0_2 = l_0_0 and l_0_0.ppid and string.lower(mp.GetProcessCommandLine(l_0_0.ppid) or "") or ""
local l_0_3 = mp.GetParentProcInfo()
local l_0_4 = l_0_3 and string.lower(l_0_3.image_path or "") or ""
local l_0_5 = l_0_3 and l_0_3.ppid and string.lower(mp.GetProcessCommandLine(l_0_3.ppid) or "") or ""
local l_0_6 = "/bin/perl"
local l_0_7 = "/libexec/postfix/spawn"
local l_0_8 = "/opt/einteract/utils/policyd-spf-perl sender="
local l_0_9 = "spawn -n policy -t unix user=nobody argv=/usr/bin/perl " .. "/opt/einteract/utils/policyd-spf-perl sender="

local function l_0_10(l_1_0, l_1_1)
  return l_1_0 ~= nil and #l_1_0 >= #l_1_1 and l_1_0:sub(-#l_1_1) == l_1_1
end

if l_0_10(l_0_1, l_0_6) and string.find(l_0_2, l_0_8, 1, true) ~= nil and l_0_10(l_0_4, l_0_7) and string.find(l_0_5, l_0_9, 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_11 = get_socket_fd_from_dup_event(this_sigattrlog[3])
local l_0_12 = get_socket_fd_from_dup_event(this_sigattrlog[4])
local l_0_13 = get_socket_fd_from_dup_event(this_sigattrlog[5])
if verify_socket_fd_triplet(l_0_11, l_0_12, l_0_13) then
  return mp.INFECTED
end
return mp.CLEAN
