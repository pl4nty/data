-- Threat: !InfrastructureShared
-- Name: 4ab3a62f866a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "remote_file_created_taint"
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p1
end
if not l_0_1 or not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = false
local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_2)
if l_0_4 then
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if sysio.IsFileExists(l_0_6) and isTainted(l_0_6, l_0_0) then
      l_0_3 = true
      break
    end
  end
end
if l_0_3 then
  mp.TriggerScanResource("file", l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
