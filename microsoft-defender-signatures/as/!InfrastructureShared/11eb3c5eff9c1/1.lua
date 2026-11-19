-- Threat: !InfrastructureShared
-- Name: 11eb3c5eff9c1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
if not this_sigattrlog[8].matched or this_sigattrlog[8].utf8p2 == nil or this_sigattrlog[8].utf8p2 == "" or this_sigattrlog[8].utf8p1 == nil or this_sigattrlog[8].utf8p1 == "" then
  return mp.CLEAN
end
l_0_0 = bm.get_imagepath()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = l_0_3.command_line
if IsExcludedByCmdlineMacOS(l_0_4) then
  return mp.CLEAN
end
l_0_1 = this_sigattrlog[8].utf8p2
l_0_2 = this_sigattrlog[8].utf8p1
local l_0_5 = mp.SIGATTR_LOG_SZ
for l_0_6 = l_0_5 - 1, 1, -1 do
  if sigattr_tail[l_0_6] ~= nil and sigattr_tail[l_0_6].attribute ~= nil and sigattr_tail[l_0_6].attribute == 16384 and sigattr_tail[l_0_6].utf8p1 ~= nil and sigattr_tail[l_0_6].utf8p1 ~= "" and string.find(sigattr_tail[l_0_6].utf8p1, "%$HOME%$/") ~= 1 and (sigattr_tail[l_0_6].utf8p1 == l_0_2 or string.find(l_0_1, sigattr_tail[l_0_6].utf8p1:match("[^/]*$"), 1, true)) then
    if SuspMacPathsToMonitor(sigattr_tail[l_0_6].utf8p1, true) then
      if sysio.IsFileExists(sigattr_tail[l_0_6].utf8p1) then
        bm.trigger_sig("BM_SusFileDownExec", sigattr_tail[l_0_6].utf8p1)
      end
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
