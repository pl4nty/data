-- Threat: !InfrastructureShared
-- Name: !#SIGATTR:RegOpenKeyBailOut
-- Type: 9

local l_0_0 = pe.get_postemu_sigattr_log_tail_size()
for l_0_1 = l_0_0, 1, -1 do
  local l_0_2 = pe.get_postemu_sigattr_log_tail(l_0_1)
  if l_0_2.attribute ~= 12305 and l_0_2.attribute ~= 12363 then
    if l_0_2.attribute == 12300 then
      local l_0_3 = l_0_2.p1
      if string.sub(l_0_3, 1, string.len("SOFTWARE\\Microsoft\\VBA\\Monitors")) == "SOFTWARE\\Microsoft\\VBA\\Monitors" then
        return mp.CLEAN
      end
      return mp.INFECTED
    else
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
