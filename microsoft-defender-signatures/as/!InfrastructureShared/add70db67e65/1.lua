-- Threat: !InfrastructureShared
-- Name: add70db67e65
-- Type: 21

local l_0_0 = mp.hstr_full_log()
if l_0_0 == nil then
  return mp.CLEAN
end
if not l_0_0[3].matched and not l_0_0[4].matched then
  return mp.CLEAN
end
if not l_0_0[5].matched and not l_0_0[6].matched then
  return mp.CLEAN
end
if not l_0_0[7].matched and not l_0_0[8].matched then
  return mp.INFECTED
end
local l_0_1 = mp.GetScannedPPID()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)

local function l_0_3(l_1_0)
  l_1_0 = l_1_0:gsub("%s%-p%s+\"[^\"]*\"", "")
  l_1_0 = l_1_0:gsub("%s%-%-prompt%s+\"[^\"]*\"", "")
  l_1_0 = l_1_0:gsub("%s+", " ")
  l_1_0 = l_1_0:gsub("^%s+", "")
  l_1_0 = l_1_0:gsub("%s+$", "")
  return l_1_0
end

local l_0_4 = l_0_3(l_0_2)
if string.find(l_0_4, "claude", 1, true) == nil then
  return mp.CLEAN
end
if string.find(l_0_4, "--remote", 1, true) == nil and string.find(l_0_4, "/remote on", 1, true) == nil then
  return mp.CLEAN
end
if string.find(l_0_4, "--yolo", 1, true) == nil and string.find(l_0_4, "--allow-all", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
