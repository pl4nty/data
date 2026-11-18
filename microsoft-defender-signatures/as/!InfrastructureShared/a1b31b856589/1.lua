-- Threat: !InfrastructureShared
-- Name: a1b31b856589
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  local l_0_4 = string.lower(string.match(l_0_3.image_path, "/([^/]+)$"))
  if l_0_4 == "java" or l_0_4 == "sshd" then
    local l_0_5 = string.lower(mp.GetProcessCommandLine(l_0_3.ppid))
    if string.find(l_0_5, "catalina.base=/usr/share/tomcat", 1, true) then
      return mp.INFECTED
    end
    if l_0_5 == "sshd" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
