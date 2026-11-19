-- Threat: !InfrastructureShared
-- Name: 1a292dd3e34f
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 then
  local l_0_1 = {
    "/var/tmp",
    "/tmp/",
    "/dev/shm/"
  }
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if l_0_0:find(l_0_3, 1, true) ~= nil then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
