-- Threat: !InfrastructureShared
-- Name: 27b328622a10
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
local l_0_1 = true
local l_0_2, l_0_3
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 then
  l_0_2, l_0_3 = string.find(l_0_0, "/tmp/", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_1 = false
  end
  l_0_2, l_0_3 = string.find(l_0_0, "/var/tmp/", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_1 = false
  end
  l_0_2, l_0_3 = string.find(l_0_0, "/var/mail/", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_1 = false
  end
  l_0_2, l_0_3 = string.find(l_0_0, "/var/lock/", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_1 = false
  end
  l_0_2, l_0_3 = string.find(l_0_0, "/home/", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_1 = false
  end
  l_0_2, l_0_3 = string.find(l_0_0, "/root/", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_1 = false
  end
  l_0_2, l_0_3 = string.find(l_0_0, "/dev/shm/", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_1 = false
  end
  l_0_2, l_0_3 = string.find(l_0_0, "/var/spool/mail/", 1, true)
  if l_0_2 ~= nil and l_0_3 ~= nil then
    l_0_1 = false
  end
end
if l_0_1 == false then
  local l_0_4 = bm.get_current_process_startup_info()
  local l_0_5, l_0_6 = bm.get_process_relationships(l_0_4.ppid)
  for l_0_7, l_0_8 in ipairs(l_0_5) do
    bm.add_related_process(l_0_8.ppid)
    TrackPidAndTechniqueBM(l_0_8.ppid, "T1547.006", "Persistence")
  end
  return mp.INFECTED
end
return mp.CLEAN
