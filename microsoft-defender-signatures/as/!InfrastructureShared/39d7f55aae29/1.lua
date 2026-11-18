-- Threat: !InfrastructureShared
-- Name: 39d7f55aae29
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.match(l_0_1, "tomcat.exe$") then
    local l_0_2 = mp.GetProcessCommandLine(l_0_0.ppid)
    if l_0_2 ~= nil then
      l_0_2 = string.lower(l_0_2)
      if string.match(l_0_2, "tomcat.exe%s+/+rs/+goanywhere") then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
