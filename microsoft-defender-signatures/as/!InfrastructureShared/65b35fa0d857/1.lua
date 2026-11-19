-- Threat: !InfrastructureShared
-- Name: 65b35fa0d857
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\openfiles.exe", 1, true) or string.find(l_0_0, "\\microsoft\\teams\\current\\teams.exe", 1, true) then
    return mp.CLEAN
  end
  bm.add_action("EmsScan", 5000)
  return mp.INFECTED
end
return mp.CLEAN
