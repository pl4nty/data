-- Threat: !InfrastructureShared
-- Name: 146b312c936cf
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local function l_0_0(l_1_0, l_1_1)
  if l_1_0 == nil or l_1_1 == nil then
    return false
  end
  l_1_1 = l_1_1:gsub("%s+$", "")
  local l_1_2 = "%w%w%w%w%w%w"
  local l_1_3 = "%w%w%w%w%w%w%w%w%w%w"
  local l_1_4 = "/var/folders/zz/zyxvpxvq6csfxvn_n0000000000000/T/"
  local l_1_5 = l_1_4 .. "koi_mdm_XXXXXX%.pyz%." .. l_1_3
  if l_1_0 == "/bin/chmod" then
    local l_1_6 = l_1_1:gsub("^/bin/chmod ", "chmod ", 1)
    if l_1_6:find("^chmod a%+x /tmp/vpn%." .. l_1_2 .. "$") then
      return true
    end
    if l_1_6:find("^chmod 0?755 /tmp/com%.microsoft%.autoupdate%.fba%." .. l_1_2 .. "$") then
      return true
    end
    if l_1_6:find("^chmod %+x " .. l_1_5 .. "$") then
      return true
    end
    if l_1_6:find("^chmod %+x " .. l_1_4 .. "tmp%." .. l_1_3 .. "$") then
      return true
    end
  elseif l_1_0:find("/[Pp]ython[%d%.]*$") and l_1_1:find(" %-I " .. l_1_5 .. " %-%-pkg%-version [%d%.]+$") then
    return true
  end
  return false
end

local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
local l_0_3 = bm.get_current_process_startup_info()
local l_0_4 = l_0_3.command_line
if IsExcludedByCmdlineMacOS(l_0_4) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if l_0_0(l_0_2, l_0_4) then
  return mp.CLEAN
end
local l_0_5
local l_0_6 = 0
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[8].np2 ~= nil then
  l_0_5 = this_sigattrlog[8].utf8p1
  l_0_6 = this_sigattrlog[8].np2
end
if l_0_5 == nil or l_0_6 == nil then
  return mp.CLEAN
end

function ExtendedSuspMacPathsToMonitor(l_2_0)
  if SuspMacPathsToMonitor(l_2_0, true) then
    return true
  end
  if l_2_0:find("^/Users/[^/]+/Desktop/", 1, false) or l_2_0:find("^/Users/[^/]+/Documents/", 1, false) or l_2_0:find("^/Users/[^/]+/Downloads/", 1, false) or l_2_0:find("^/Users/[^/]+/Library/[^/]+$", 1, false) or l_2_0:find("^/Users/[^/]+/Library/[^/]+/[^/]+$", 1, false) or l_2_0:find("^/Library/[^/]+$", 1, false) or l_2_0:find("^/Library/[^/]+/[^/]+$", 1, false) then
    return true
  end
  return false
end

if not ExtendedSuspMacPathsToMonitor(l_0_5) then
  return mp.CLEAN
end
if IsChmodMacOSExcluded(l_0_5) then
  return mp.CLEAN
end
local l_0_7 = tonumber(tostring(l_0_6), 8)
local l_0_8, l_0_9, l_0_10, l_0_11 = mp.bsplit(l_0_7, 3)
if l_0_8 == 0 and l_0_9 == 0 and l_0_10 == 0 and l_0_11 == 0 then
  return mp.CLEAN
end
local l_0_12 = bm.get_imagepath()
if l_0_12 == nil then
  return mp.CLEAN
end
local l_0_13 = "BM"
if string.find(l_0_12, "/chmod", -6, true) then
  l_0_13 = l_0_1.ppid
end
local l_0_14 = false
if mp.bitand(l_0_8, 1) == 1 or mp.bitand(l_0_9, 1) == 1 or mp.bitand(l_0_10, 1) == 1 then
  if l_0_13 == "BM" then
    bm.trigger_sig("MacChmodToExec", l_0_5)
  else
    bm.trigger_sig("MacChmodToExec", l_0_5, l_0_13)
  end
  TrackPidAndTechniqueBM(l_0_13, "T1222.002", "DefenseEvasion_PermissionModification_MacChmodToExec")
  l_0_14 = true
end
if mp.bitand(l_0_11, 2) == 2 or mp.bitand(l_0_11, 4) == 4 then
  if l_0_13 == "BM" then
    bm.trigger_sig("UidGidChange", l_0_5)
  else
    bm.trigger_sig("UidGidChange", l_0_5, l_0_13)
  end
  TrackPidAndTechniqueBM(l_0_13, "T1548.001", "PrivilegeEscalation_AbuseElevationControlMechanism_MacSetuidSetgid")
  l_0_14 = true
end
if l_0_14 == false then
  return mp.CLEAN
end
bm.add_related_file(l_0_5)
addRelatedProcess()
return mp.INFECTED
