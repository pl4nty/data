-- Threat: !InfrastructureShared
-- Name: 6ab36756db17
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  if l_0_0 ~= nil and string.len(l_0_0) > 3 then
    if string.find(l_0_0, "cisco", 1, true) or string.find(l_0_0, "dosbox", 1, true) or string.find(l_0_0, "install", 1, true) or string.find(l_0_0, "setup", 1, true) or string.find(l_0_0, "\\icheck\\", 1, true) or string.find(l_0_0, "\\ccm\\", 1, true) or string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "netstat", 1, true) or string.find(l_0_0, "vc_redist", 1, true) or string.find(l_0_0, "restarthealthservice", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
