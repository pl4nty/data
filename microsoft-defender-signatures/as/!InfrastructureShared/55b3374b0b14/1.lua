-- Threat: !InfrastructureShared
-- Name: 55b3374b0b14
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
else
  return mp.CLEAN
end
if not l_0_0.utf8p2 then
  return mp.CLEAN
end
local l_0_1 = {}
local l_0_2 = "0x0c347ca0"
local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_0.utf8p2)
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if string.lower(l_0_5) ~= string.lower(l_0_0.image_path) and sysio.IsFileExists(l_0_5) then
    local l_0_6 = l_0_0.ppid .. ";" .. l_0_2 .. ";" .. l_0_5
    table.insert(l_0_1, l_0_6)
  end
end
if 0 < #l_0_1 then
  MpCommon.SetPersistContextNoPath("bm_ipc_taskschd", l_0_1, 10)
end
return mp.CLEAN
