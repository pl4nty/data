-- Threat: !InfrastructureShared
-- Name: bcb3843235bb
-- Type: 21

local l_0_0
local l_0_1 = "\\cmd.exe"
local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if l_0_5.image_path ~= nil and string.sub(l_0_5.image_path, -#l_0_1) == l_0_1 then
    local l_0_6 = mp.bitand(l_0_5.reason_ex, 1)
    if l_0_6 == 1 then
      l_0_0 = string.lower(mp.GetProcessCommandLine(l_0_5.ppid))
      bm.add_threat_process(l_0_5.ppid)
      break
    end
  end
end
if l_0_0 ~= nil and #l_0_0 > #l_0_1 then
  local l_0_7 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    if string.sub(l_0_9, -#l_0_1) ~= l_0_1 and sysio.IsFileExists(l_0_9) then
      bm.add_threat_file(l_0_9)
    end
  end
end
return mp.INFECTED
