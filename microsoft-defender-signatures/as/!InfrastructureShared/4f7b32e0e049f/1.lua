-- Threat: !InfrastructureShared
-- Name: 4f7b32e0e049f
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  "/var/tmp/",
  "/tmp/",
  "/home/",
  "/srv/ftp/",
  "/root/",
  "/mnt/",
  "/dev/shm/",
  "/var/spool/"
}
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if l_0_5 and sysio.IsFileExists(l_0_5) then
    for l_0_6, l_0_7 in ipairs(l_0_3) do
      if l_0_5:sub(1, #l_0_7) == l_0_7 then
        bm.trigger_sig("BMScriptExecutionFromSuspiciousLocation", l_0_5)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
