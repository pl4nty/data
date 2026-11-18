-- Threat: !InfrastructureShared
-- Name: adb3ef908fb0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3.image_path ~= nil and l_0_3.ppid ~= nil and contains(l_0_3.image_path, {
    "rundll32, regsvr32"
  }) then
    local l_0_4 = extractDllForRegproc(l_0_3.cmd_line)
    if l_0_4 then
      bm.add_related_file(l_0_4)
    end
  end
end
return mp.INFECTED
