-- Threat: !InfrastructureShared
-- Name: 506b3ea4cf923
-- Type: 21
-- Includes: BMLuaLib

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0, p1_1)
  local r1_0 = not (p1_0 == nil or not (#p1_1 <= #p1_0 and p1_0:sub(-#p1_1) == p1_1))
  return r1_0
end

local r0_1 = string.lower
local r0_2 = bm.get_imagepath() or ""
local r0_3, r0_4
repeat
  r0_3 = r0_1(r0_2)
  local r0_5 = bm.get_current_process_startup_info()
  if r0_5 and r0_5.ppid then
    r0_4 = string.lower
    r0_4 = r0_4(mp.GetProcessCommandLine(r0_5.ppid) or "")
    if r0_4 then
      break
    end
  end
  r0_4 = ""
until true
local r0_6 = r0_0
r0_6 = r0_6(r0_3, "/sbin/in.rshd")
if r0_6 then
  return mp.CLEAN
end
local r0_7 = string.find(r0_3, "/bse/bin/bshell", 1, true)
if r0_7 ~= nil and string.find(r0_4, "/socket<", 1, true) ~= nil then
  return mp.CLEAN
end
local r0_8, r0_9
repeat
  r0_8 = mp.GetParentProcInfo()
  if r0_8 then
    local r0_10 = string.lower
    local r0_11 = r0_8.image_path
    r0_10 = r0_10(r0_11 or "")
    if r0_10 then
      r0_9 = r0_10
      break
    end
  end
  r0_9 = ""
until true
local r0_12
repeat
  if r0_8 and r0_8.ppid then
    local r0_13 = string.lower
    r0_13 = r0_13(mp.GetProcessCommandLine(r0_8.ppid) or "")
    if r0_13 then
      r0_12 = r0_13
      break
    end
  end
  r0_12 = ""
until true
local r0_14, r0_15 = "/opt/einteract/utils/policyd-spf-perl sender=", r0_0
r0_15 = r0_15(r0_9, "/libexec/postfix/spawn") or r0_0(r0_9, "/libexec/postfix/master")
local r0_16 = r0_0
r0_16 = r0_16(r0_3, "/bin/perl")
if not (r0_16 and string.find(r0_4, r0_14, 1, true) ~= nil
  or r0_15 and string.find(r0_12, r0_14, 1, true) ~= nil) then
  local r0_17 = get_socket_fd_from_dup_event(this_sigattrlog[11])
  local r0_18 = get_socket_fd_from_dup_event(this_sigattrlog[12])
  local r0_19 = get_socket_fd_from_dup_event(this_sigattrlog[13])
  if verify_socket_fd_triplet(r0_17, r0_18, r0_19) then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
