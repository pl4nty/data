-- Threat: !InfrastructureShared
-- Name: dbb3c2325b4f
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and string.lower(string.sub(l_0_3.image_path, -9)) == "/bin/java" then
    local l_0_4 = string.lower(mp.GetProcessCommandLine(l_0_3.ppid))
    if string.find(l_0_4, "catalina.base=/usr/share/tomcat", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
